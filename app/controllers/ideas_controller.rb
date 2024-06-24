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
    @recommended_post1 = Idea.find_by(id: "1")
    @recommended_post2 = Idea.find_by(id: "2")
    @recommended_post3 = Idea.find_by(id: "3")
    
    # Meta
    @title = "LÒÒCHOK | #{@idea.title}"
    # end
  end

  # GET /ideas/new
  def new
    @tutorial = Tutorial.friendly.find(params[:tutorial_id]) if params[:tutorial_id]
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

    if params[:tutorial_id]
      @tutorial = Tutorial.friendly.find(params[:tutorial_id])
      @tutorial.ideas << @idea if @idea.save
      redirect_to @tutorial, notice: "Idea was successfully created and linked to the Tutorial."
    else
      if @idea.save
        redirect_to @idea, notice: "Idea was successfully created."
      else
        render :new
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
      params.require(:idea).permit(:title, :description, :image, :tag_list, :tutorial_ids).merge(user_id: current_user.id)
    end
end
