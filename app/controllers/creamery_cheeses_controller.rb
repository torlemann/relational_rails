class CreameryCheesesController < ApplicationController
    def index
        @creamery = Creamery.find(params[:creamery_id])
        @cheeses = @creamery.cheeses
    end
end