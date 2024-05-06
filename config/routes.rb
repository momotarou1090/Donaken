Rails.application.routes.draw do
  # 既存のルート
  get 'payments/new'
  get 'payments/success', as: 'success'
  get 'payments/failure', as: 'failure'

  # "/charge" へのPOSTリクエストをPaymentsControllerのchargeアクションにルーティングする
  post 'charge', to: 'payments#charge'

  post 'tokens/create'
end
