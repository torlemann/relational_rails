class CreameriesController < ApplicationController
    def index
        @creameries = Creamery.all
    end

    def new
    end

    def create
        task = Creamery.create!({
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

        redirect_to'/creameries'
    end

    def show
        @creamery = Creamery.find(params[:id])
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