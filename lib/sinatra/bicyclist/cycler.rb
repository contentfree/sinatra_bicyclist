module Sinatra
  module Bicyclist
    class Cycler
      attr_accessor :duration

      def initialize(settings)
        @settings = settings
      end

      def routes
        @settings.routes_to_cycle_through
      end

      def has_groups?
        Hash === @settings.routes_to_cycle_through
      end

      def pages(group = nil)
        return routes[group.to_sym] if has_group?(group)

        case routes
          when Array then routes
          when Hash then routes.keys
        end
      end

      def has_group?(name)
        name && has_groups? && pages.map(&:to_s).include?(name.to_s)
      end

      def group
        has_groups?
      end

      def page_index(session)
        page_index = session[:_cycle_page_index] || -1
        session[:_cycle_page_index] = page_index + 1
      end

      def random_route(session, group)
        number_of_routes = pages(group).length
        pages(group)[page_index(session) % number_of_routes]
      end

      def reset_index(session)
        session[:_cycle_page_index] = -1
      end

      def page(session, group = nil)
        reset_index(session) if group.to_s != session[:_last_cycle].to_s
        page = random_route(session, group)
        session[:_cycle] = group || (has_groups? && page)
        page
      end
    end

  end
end
