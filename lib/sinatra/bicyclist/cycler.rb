require_relative 'cycle'

module Sinatra
  module Bicyclist
    class Cycler
      attr_accessor :duration

      def initialize(settings, cycle_class = Bicyclist::Cycle)
        @settings = settings
        @cycle_class = cycle_class
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

      def page(session, group = nil)
        cycle = @cycle_class.new(session)
        cycle.reset_index unless cycle.last_cycle == group.to_s
        page = cycle.page pages(group)
        session[:_cycle] = group || (has_groups? && page)
        page
      end
    end

  end
end
