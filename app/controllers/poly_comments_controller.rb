class PolyCommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @poly_comment = PolyComment.new(poly_comment_params)

    respond_to do |format|
      if @poly_comment.save
        format.html { redirect_back fallback_location: root_path, notice: "Комментарий успешно создан" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def poly_comment_params
    params.require(:poly_comment).permit(:body, :commentable_type, :commentable_id).merge(user_id: current_user.id)
  end
end
