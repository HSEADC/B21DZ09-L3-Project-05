class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    p = nil
    if params[:post]
      p = post_params
    elsif params[:idea_post]
      p = idea_post_params
    elsif params[:tutorial_post]
      p = tutorial_post_params
    end

    @post = Post.new(p)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_url(@post), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    p = nil
    if params[:post]
      p = post_params
    elsif params[:idea_post]
      p = idea_post_params
    elsif params[:tutorial_post]
      p = tutorial_post_params
    end

    respond_to do |format|
      if @post.update(p)
        format.html { redirect_to admin_post_url(@post), notice: "Пост успешно изменён" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :type, :description, :post_image, :contetn_link, :category_id, :created_at).merge(user_id: current_user.id)
    end

    def idea_post_params
      params.require(:idea_post).permit(:title, :type, :description, :post_image, :contetn_link, :category_id, :created_at).merge(user_id: current_user.id)
    end

    def tutorial_post_params
      params.require(:tutorial_post).permit(:title, :type, :description, :post_image, :contetn_link, :category_id, :created_at).merge(user_id: current_user.id)
    end
end
