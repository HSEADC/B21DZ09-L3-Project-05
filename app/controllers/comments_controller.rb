class CommentsController < ApplicationController

  def create
    # commentable = nil
    # commentable_id = comment_params[:commentable_id]
    
    # if comment_params[commentable_type] == "IdeaPost"
    #   commentable = IdeaPost.find(commentable_id)
    # elsif comment_params[commentable_type] == "TutorialPost"
    #   commentable = TextPost.find(commentable_id)
    # end
    
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_back fallback_location: root_path, notice: "Комментарий успешно создан" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_type, :post_id).merge(user_id: current_user.id)
    end
end
