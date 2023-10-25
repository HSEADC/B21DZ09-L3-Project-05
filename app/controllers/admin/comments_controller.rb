class Admin::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @post = @comment.post
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(post_id: @post.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to admin_post_url(@post), notice: "Комментарий успешно создан" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @post = @comment.post

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to admin_post_url(@post), notice: "Комментарий успешно изменён" }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @post = @comment.post
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to admin_post_url(@post), notice: "Комментарий успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
