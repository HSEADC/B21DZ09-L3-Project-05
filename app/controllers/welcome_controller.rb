class WelcomeController < ApplicationController
  def index
    # Meta
    @title = "LÒÒCHOK | Медиа о кастоме"
    # end

    @recom_post4 = Post.find_by(id: "2")
    @recom_post5 = Post.find_by(id: "3")
    @recom_post6 = Post.find_by(id: "1")
    @recom_post7 = Post.find_by(id: "1")
    @recom_post8 = Post.find_by(id: "2")

    # ActionCable.server.broadcast("notifications_channel", { body: "LOOCHOK" })
  end

  def about
    @subscription = Subscription.new

    # Meta
    @title = "LÒÒCHOK | О нас"
    # end
  end

  def search
    @items = PgSearch.multisearch(params['search'])
  end
end
