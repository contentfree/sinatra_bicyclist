require 'sinatra/base'
require_relative 'bicyclist/version'
require_relative 'bicyclist/cycler'

module Sinatra
  module Bicyclist
    def self.registered(app)
      app.enable :sessions
      app.set :routes_to_cycle_through, {}
      app.set :cycle_duration, 3
      app.set :cycler, Sinatra::Bicyclist::Cycler.new(app.settings)

      app.get '/_cycle' do
        session[:_cycle_duration] = params[:duration] if params.has_key?('duration')

        page = settings.cycler.page(session)
        redirect settings.cycler.group ? "/_cycle/#{page}" : "/#{page}"
      end

      app.get '/_cycle/:group' do
        session[:_cycle_duration] = params[:duration] if params.has_key?('duration')

        page = settings.cycler.page(session, params[:group])
        redirect "/#{page}"
      end

      app.before do
        session[:_cycle_duration] ||= settings.cycle_duration

        if group = session.delete(:_cycle)
          headers["Refresh"] = "#{session[:_cycle_duration]}; url=/_cycle/#{group}"
          session[:_last_cycle] = group
        end
      end
    end
  end

  register Bicyclist
end
