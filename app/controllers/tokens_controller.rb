# app/controllers/tokens_controller.rb
class TokensController < ApplicationController
  def create
    ethereum_client = EthereumClient.new
    ethereum_client.some_method
    # 必要な処理をここに記述
  end
end
