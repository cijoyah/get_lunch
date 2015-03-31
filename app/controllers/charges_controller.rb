class ChargesController < ApplicationController

  def create
    @promotion = Promotion.find(params[:promotion_id])
    @amount = @promotion.price*100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_i,
      :description => @promotion.pitch,
      :currency    => 'gbp'
    )

    client = Twilio::REST::Client.new

    customer_response = send_customer_text(client, '+447960577601')
    business_responce = send_business_text(client, '+447960577601')

    puts customer_response.status

  rescue Stripe::CardError => e
    flash[:error] = e.message
  ensure
    redirect_to @promotion
  end

  def send_customer_text(client, customer_number)
    client.messages.create(
    from: '+15005550006',
    to: customer_number,
    body: 'Hey there!'
    )
  end

  def send_business_text(client, business_number)
    client.messages.create(
    from: '+15005550006',
    to: business_number,
    body: 'Hey fejbhjeshbgeksjhbgsekjbjrng!'
    )
  end
  
end
