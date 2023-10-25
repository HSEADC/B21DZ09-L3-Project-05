class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def ideas
    @category = Category.find_by_name('Идеи')
  end

  def tutorials
  end

  def forum
  end
end
