class WelcomeController < ApplicationController
  def index
    # Meta
    @title = "LÒÒCHOK — Медиа о кастоме"
    # end

    @recom_post4 = Post.find_by(id: "4")
    @recom_post5 = Post.find_by(id: "3")
    @recom_post6 = Post.find_by(id: "5")
    @recom_post7 = Post.find_by(id: "11")
    @recom_post8 = Post.find_by(id: "22")
    @recom_post9 = Post.find_by(id: "26")
    @recom_post10 = Post.find_by(id: "25")
  end

  def about
    @subscription = Subscription.new

    # Meta
    @title = "LÒÒCHOK | О нас"
    # end
  end

  def ideas
    # @posts = Post.find_by_type('IdeaPost')

    # Meta
    @title = "LÒÒCHOK | Идеи кастома"
    # end
  end

  def tutorials
    # Meta
    @title = "LÒÒCHOK | Туториалы"
    # end
  end

end
