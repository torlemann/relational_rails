class CreameryCheesesController < ApplicationController
    def index
        @creamery = Creamery.find(params[:creamery_id])
        if params[:sort] == "name"
            @cheeses = @creamery.cheeses.alphabetize
        else
            @cheeses = @creamery.cheeses
        end
    end

    def new
        @creamery = Creamery.find(params[:creamery_id])
    end

    def create
        @creamery = Creamery.find(params[:creamery_id])
        @creamery.cheeses.create!(
            name: params[:name],
            style: [:style],
            net_wt: 0,
            milk_type: params[:head_cheesemaker],
            veg_rennet: true,
            raw: true
        )
        redirect_to "/creameries/#{@creamery.id}/cheeses"
    end
end