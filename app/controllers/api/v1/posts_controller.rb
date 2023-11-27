class Api::V1::PostsController < Api::V1::ApplicationController

  def index
    @posts = Post.all

    # render :index
    # render json: @posts

    # render json: @posts.map { |post| post.api_as_json }
  end

  def show
    @post = Post.find(params[:id])
  end

end
