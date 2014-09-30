module RackSupport
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end
