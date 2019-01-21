CFP::Application.boot :settings, from: :system do
  before :init do
    ::Kernel.require 'types'
  end

  settings do
    key :database_url, Types::Strict::String.constrained(filled: true)
    key :session_key, Types::Strict::String.constrained(filled: true)
    key :github_key, Types::Strict::String.constrained(filled: true)
    key :github_secret, Types::Strict::String.constrained(filled: true)
  end
end
