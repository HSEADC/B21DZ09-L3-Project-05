class WelcomeController < ApplicationController
  def index
    # Meta
    @title = "LÒÒCHOK — Медиа о кастоме"
    # end
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
