class Api::V1::CommentsController < Api::V1::ApplicationController

  # load_and_authorize_resource
  # before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

end
