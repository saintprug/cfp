module CFP
  module Web
    class Application < Sinatra::Base
      enable :sessions
      set :session_secret, CFP::Application[:settings].session_key
      set :inline_templates, true

      use OmniAuth::Builder do
        provider :github, CFP::Application[:settings].github_key, CFP::Application[:settings].github_secret, scope: 'user'
      end

      get '/auth/:provider/callback' do
        erb "<pre>#{JSON.pretty_generate(request.env['omniauth.auth'])}</pre>"
      end

      get '/' do
        "<a href='/auth/github'>Sign in with github</a>"
      end
    end
  end
end
