class CreameriesController < ApplicationController
    def index
        @creameries = Creamery.all
    end

    def new
    end

    def create
        task = Task.create!({
            name: params[:creamery][:name]
            date_founded: params[:creamery][:date_founded]
            owner: params[:creamery][:owner]
            head_cheesemaker: params[:creamery][:head_cheesemaker]
            location: params[:creamery][:location]
            farmstead: params[:creamery][:farmstead]
            acreage: params[:creamery][:acreage]
            awards_won: params[:creamery][:awards_won]
        })

        task.save

        redirect_to'/creameries'
    end

    def show
        @creamery = Creamery.find(params[:id])
    end

    def edit
        @creamery = Creamery.find(params[:id])
    end
end