module Web
  module Admin
    class FoodsController < ApplicationController
      def index
        @pagy, @foods = pagy(Food.all)
      end
    end
  end
end
