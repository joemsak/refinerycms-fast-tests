module Refinery
  module Planets
    class PlanetsController < ::ApplicationController

      before_filter :find_all_planets
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @planet in the line below:
        present(@page)
      end

      def show
        @planet = Planet.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @planet in the line below:
        present(@page)
      end

    protected

      def find_all_planets
        @planets = Planet.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/planets").first
      end

    end
  end
end
