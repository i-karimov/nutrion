class Web::Admin::FoodsController < ApplicationController
  def index
    @pagy, @foods = pagy(Food.all)
  end
end
