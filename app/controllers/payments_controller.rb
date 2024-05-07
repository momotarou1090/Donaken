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
      if charge.paid
        flash[:success] = "Thank you for your payment!"
        transfer_tokens
        redirect_to success_path
      else
        flash[:error] = "Payment failed"
        redirect_to failure_path
      end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to failure_path
    end
  end
  private

  def transfer_tokens
    # トークン送金ロジック
    # Truffleコマンドを実行
    command = "truffle exec ./scripts/transfer.js --network amoy"
    stdout, stderr, status = Open3.capture3(command)

    if status.success?
      Rails.logger.info "Transfer successful: #{stdout}"
    else
      Rails.logger.error "Transfer failed: #{stderr}"
    end
  end


  def success
    # 支払い成功時に表示するビュー
  end

  def failure
    # 支払い失敗時に表示するビュー
  end
end
