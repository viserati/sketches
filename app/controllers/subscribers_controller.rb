class SubscribersController < ApplicationController

  def index
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    # check if subscriber exists in database table.
    if Subscriber.exists?(email: @subscriber.email)
      redirect_to root_path, alert: "Sorry that email already exists."
    elsif
      @subscriber.save
      redirect_to root_path, notice: "Thank you #{@subscriber.f_name}, for subscribing."
    else
      redirect_to root_path, alert: "Sorry, system failed to save your information. "
  end
  end

    private

    def subscriber_params
      params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
    end
end
