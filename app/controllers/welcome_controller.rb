class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def ideas
    # @posts = Post.find_by_type('IdeaPost')
  end

  def tutorials
  end

end
