PingApp::Application.routes.draw do
  resources :apns_tokens, {
    :only => ["create"]
  }
end
