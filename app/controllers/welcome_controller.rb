class WelcomeController < ApplicationController
  def index
    # Meta
    @title = "LÒÒCHOK | Медиа о кастоме"
    # end

    @recom_post4 = Post.find_by(id: "4")
    @recom_post5 = Post.find_by(id: "3")
    @recom_post6 = Post.find_by(id: "5")
    @recom_post7 = Post.find_by(id: "11")
    @recom_post8 = Post.find_by(id: "22")
    @recom_post9 = Post.find_by(id: "26")
    @recom_post10 = Post.find_by(id: "25")
    @recom_post11 = Post.find_by(id: "8")
    @recom_post12 = Post.find_by(id: "12")
    @recom_post13 = Post.find_by(id: "13")
    @recom_post14 = Post.find_by(id: "10")
    @recom_post15 = Post.find_by(id: "17")
    @recom_post16 = Post.find_by(id: "9")
    @recom_post17 = Post.find_by(id: "14")
    @recom_post18 = Post.find_by(id: "16")

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
