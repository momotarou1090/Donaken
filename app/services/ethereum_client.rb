# app/services/ethereum_client.rb
class EthereumClient
  def initialize
    @web3 = Web3::Eth::Rpc.new host: 'goerli.infura.io', 
                               port: 443,  
                               connect_options: {
                                 use_ssl: true,
                                 open_timeout: 20,
                                 read_timeout: 140,
                                 rpc_path: "/v3/YOUR_PROJECT_ID"
                               }
  end

  def some_method
    # Ethereumネットワークとのインタラクション
  end
end
