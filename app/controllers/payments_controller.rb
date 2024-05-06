class PaymentsController < ApplicationController
  protect_from_forgery except: :charge

  def new
    # 新規支払いフォームを表示
  end

  def charge
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    begin
      charge = Stripe::Charge.create({
        amount: 500,  # 金額（単位: 円）
        currency: 'jpy',
        description: 'Example charge',
        source: params[:stripeToken]  # Stripeのトークン
      })

      flash[:success] = "Thank you for your payment!"
      redirect_to success_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to failure_path
    end
  end

  def success
    # 支払い成功時に表示するビュー
  end

  def failure
    # 支払い失敗時に表示するビュー
  end
end
