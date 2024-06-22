class TutorialsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tutorial, only: %i[ show edit update destroy ]

  # GET /tutorials or /tutorials.json
  def index
    @tutorials = Tutorial.all

    # Meta
    @title = "LÒÒCHOK | Туториалы"
    # end
  end

  def by_tag
    @tutorials = Tutorial.tagged_with(params[:tag])
    render :index

    # Meta
    @title = "LÒÒCHOK | #{params[:tag]}"
    # end
  end

  # GET /tutorials/1 or /tutorials/1.json
  def show
    @recom_post1 = Tutorial.find_by(id: "1")
    @recom_post2 = Tutorial.find_by(id: "2")
    @recom_post3 = Tutorial.find_by(id: "3")

    # Meta
    @title = "LÒÒCHOK | #{@tutorial.title}"
    # end
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new

    # Meta
    @title = "LÒÒCHOK | Новый туториал"
    # end
  end

  # GET /tutorials/1/edit
  def edit
    # Meta
    @title = "LÒÒCHOK | Редактирование туториала"
    # end
  end

  # POST /tutorials or /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to tutorial_url(@tutorial), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1 or /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to tutorial_url(@tutorial), notice: "Пост успешно обновлён" }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1 or /tutorials/1.json
  def destroy
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :image, :content, :tag_list, :idea_id)
    end
end
