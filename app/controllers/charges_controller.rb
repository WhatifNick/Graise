class ChargesController < ApplicationController
  def new

  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
      )
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => 1000,
      :description => 'Rails Stripe Customer',
      :currency => 'aud'
      )


    current_user.has_paid = true
    redirect_to new_event_path

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to events_path
  end

end
