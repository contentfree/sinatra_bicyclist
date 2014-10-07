module Sinatra
  module Bicyclist
    class Cycle
      def initialize(session)
        @session = session
      end

      def page_index
        @session[:_cycle_page_index] ||= -1
      end

      # @param [Fixnum] value
      def page_index=(value)
        @session[:_cycle_page_index] = value
      end

      def reset_index
        @session[:_cycle_page_index] = -1
      end

      def last_cycle
        @session[:_last_cycle].to_s
      end

      # @param [Array] pages
      def page(pages)
        self.page_index = next_index(pages.length)
        pages[page_index]
      end

      # @param [Fixnum] max
      def next_index(max)
        page_index.succ % max
      end
    end
  end
end
