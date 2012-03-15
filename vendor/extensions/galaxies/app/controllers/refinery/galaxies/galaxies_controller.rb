module Refinery
  module Galaxies
    class GalaxiesController < ::ApplicationController

      before_filter :find_all_galaxies
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @galaxy in the line below:
        present(@page)
      end

      def show
        @galaxy = Galaxy.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @galaxy in the line below:
        present(@page)
      end

    protected

      def find_all_galaxies
        @galaxies = Galaxy.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/galaxies").first
      end

    end
  end
end
