class Admin::IdeaPostsController < Admin::ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.where("type = 'IdeaPost'")

    # Meta
    @title = "LÒÒCHOK | Идеи кастома"
    # end
  end

  def by_tag
    @posts = IdeaPost.tagged_with(params[:tag])
    render :index

    # Meta
    @title = "LÒÒCHOK | Фильтры"
    # end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @recom_post1 = Post.find_by(id: "13")
    @recom_post2 = Post.find_by(id: "16")
    @recom_post3 = Post.find_by(id: "11")
  end

  # GET /posts/new
  def new
    @post = IdeaPost.new

    # Meta
    @title = "LÒÒCHOK | Новая идея"
    # end
  end

  # GET /posts/1/edit
  def edit
    # Meta
    @title = "LÒÒCHOK | Редактирование идеи"
    # end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(idea_post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_idea_post_url(@post), notice: "Пост успешно создан" }
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
      if @post.update(idea_post_params)
        format.html { redirect_to admin_idea_post_url(@post), notice: "Пост успешно изменён" }
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
      format.html { redirect_to admin_idea_posts_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_post_params
      params.require(:idea_post).permit(:title, :type, :description, :post_image, :tag_list, :category_id).merge(user_id: current_user.id)
    end
end
