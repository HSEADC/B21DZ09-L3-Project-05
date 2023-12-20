class SubscriptionsController < ApplicationController  
    def show
      # Meta
      @title = "LÒÒCHOK | Подписка"
      # end
    end
  
    def create
      @subscription = Subscription.new(subscription_params)
  
      respond_to do |format|
        if @subscription.save
          format.html { redirect_to subscription_url(@subscription), notice: "Добавлена новая подписка" }
          format.json { render :show, status: :created, location: @subscription }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
        def subscription_params
        params.require(:subscription).permit(:email)
      end
  end