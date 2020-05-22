class PaymentsController < ApplicationController
  def get_stripe_id
    @agreement = Agreement.find(params[:id])
    @resource = Resource.find(@agreement.resource_id)
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @resource.name,
        description: @agreement.terms,
        amount: @agreement.price * 100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          resource_id: @resource.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&agreementId=#{@agreement.id}",
      cancel_url: "#{root_url}users/#{current_user.id}/agreements"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end
end
