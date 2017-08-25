class ChargesController < ApplicationController

  def new
    $product = Product.find(params[:product_id])
    $price = $product.price
    # To convert the unit from dollars to cents  
    $amount = ($price * 100).round
    $description = $product.description
  end
        
def create    
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => $amount,
    :description => $description,
   :currency    => 'usd'
  )

 rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
 end    

end
