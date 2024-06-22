class IdeasController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea, only: %i[ show edit update destroy ]

  # GET /ideas or /ideas.json
  def index
    @ideas = Idea.all

    # Meta
    @title = "LÒÒCHOK | Идеи кастома"
    # end
  end

  def by_tag
    @ideas = Idea.tagged_with(params[:tag])
    render :index

    # Meta
    @title = "LÒÒCHOK | #{params[:tag]}"
    # end
  end

  # GET /ideas/1 or /ideas/1.json
  def show
    # Meta
    @title = "LÒÒCHOK | #{@idea.title}"
    # end
  end

  # GET /ideas/new
  def new
    @idea = Idea.new

    # Meta
    @title = "LÒÒCHOK | Новая идея"
    # end
  end

  # GET /ideas/1/edit
  def edit
    # Meta
    @title = "LÒÒCHOK | Редактирование идеи"
    # end
  end

  # POST /ideas or /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to idea_url(@idea), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1 or /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to idea_url(@idea), notice: "Пост успешно изменён" }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1 or /ideas/1.json
  def destroy
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:title, :description, :image, :tag_list).merge(user_id: current_user.id)
    end
end
