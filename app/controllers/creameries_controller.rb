class CreameriesController < ApplicationController
    def index
        @creameries = Creamery.all
    end

     def show
        @creamery = Creamery.find(params[:id])
    end

    def new
    end

    def create
        Creamery.create!(
            name: params[:name],
            date_founded: 0,
            owner: params[:owner],
            head_cheesemaker: params[:head_cheesemaker],
            location: params[:location],
            farmstead: true,
            acreage: 0,
            awards_won: params[:awards_won]
        )

        redirect_to'/creameries'
    end

    def edit
        @creamery = Creamery.find(params[:id])
    end

    def update
        creamery = Creamery.find(params[:id])
        creamery.update(
            name: params[:name],
            date_founded: params[:date_founded],
            owner: params[:owner],
            head_cheesemaker: params[:head_cheesemaker],
            location: params[:location],
            farmstead: params[:farmstead],
            acreage: params[:acreage],
            awards_won: params[:awards_won]
        )
        redirect_to "/creameries/#{creamery.id}"
    end

    def destroy
        Creamery.destroy(params[:id])
        redirect_to '/creameries'
    end
end