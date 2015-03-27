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

    send_customer_text('08766757')
    send_business_text('345678')

    @client = Twilio::REST::Client.new
    # @client.messages.create(
    # from: '+15005550006',
    # to: '+447931525255',
    # body: 'Hey there!'
    # )

  rescue Stripe::CardError => e
    flash[:error] = e.message
  ensure
    redirect_to @promotion
  end

  def send_customer_text(customer_number)
    @client.messages.create(
    from: '+15005550006',
    to: customer_number,
    body: 'Hey there!'
    )
  end

  def send_business_text(business_numbr)
     @client.messages.create(
    from: '+15005550006',
    to: business_numbr,
    body: 'Hey fejbhjeshbgeksjhbgsekjbjrng!'
    )
  end
  
end
