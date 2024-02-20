class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all

    # Meta
    @title = "LÒÒCHOK | Все публикации"
    # end
  end

  def by_tag
    @posts = Post.tagged_with(params[:tag])
    render :index
  end

  # GET /posts/1 or /posts/1.json
  def show
    # Meta
    @title = "LÒÒCHOK | #{@post.title}"
    # end
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
    @post = Post.new(sti_post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(sti_post_params)
        format.html { redirect_to post_url(@post), notice: "Пост успешно изменён" }
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
      format.html { redirect_to posts_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def post_params
    #   params.require(:post).permit(:title, :type, :description, :post_image, :category_id, :created_at).merge(user_id: current_user.id)
    # end

    # def idea_post_params
    #   params.require(:idea_post).permit(:title, :type, :description, :post_image, :category_id, :created_at).merge(user_id: current_user.id)
    # end

    # def tutorial_post_params
    #   params.require(:tutorial_post).permit(:title, :type, :description, :post_image, :category_id, :created_at).merge(user_id: current_user.id)
    # end

    def sti_post_params
        p = nil
        
      if params[:post]
        p = params.require(:post)
      elsif params[:idea_post]
        p = params.require(:idea_post)
      elsif params[:tutorial_post]
        p = params.require(:tutorial_post)
      end

      p.permit(:title, :type, :description, :post_image, :contetn_link, :tag_list, :category_id, :created_at).merge(user_id: current_user.id)
    end
end
