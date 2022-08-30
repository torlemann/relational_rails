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
        creamery.update({
            name: params[:creamery][:name],
            date_founded: params[:creamery][:date_founded],
            owner: params[:creamery][:owner],
            head_cheesemaker: params[:creamery][:head_cheesemaker],
            location: params[:creamery][:location],
            farmstead: params[:creamery][:farmstead],
            acreage: params[:creamery][:acreage],
            awards_won: params[:creamery][:awards_won]
        })
        creamery.save
        redirect_to "/creameries/#{creamery.id}"
    end

    def destroy
        Creamery.destroy(params[:id])
        redirect_to '/creameries'
    end
end