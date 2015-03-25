class ChargesController < ApplicationController

  def new
  end

  def create
    @promotion = Promotion.find(params[:promotion_id])
    @amount = @promotion.price*100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @promotion.pitch,
      :currency    => 'gdp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
