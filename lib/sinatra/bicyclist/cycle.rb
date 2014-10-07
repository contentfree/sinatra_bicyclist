module Sinatra
  module Bicyclist
    class Cycle
      def initialize(session)
        @session = session
      end

      def page_index
        @session[:_cycle_page_index] ||= -1
      end

      def next_index
        page_index.succ
      end

      def page_index=(value)
        @session[:_cycle_page_index] = value
      end

      def reset_index
        @session[:_cycle_page_index] = -1
      end

      def last_cycle
        @session[:_last_cycle].to_s
      end

      def page(pages)
        index = next_route(pages)
        pages[index]
      end

      def next_route(pages)
        routes = pages.length

        self.page_index = next_index % routes
      end
    end
  end
end
