class CheesesController < ApplicationController
    def index
        @cheeses = Cheese.all
    end

    def show
        @cheese = Cheese.find(params[:id])
    end

    def edit
        @cheese = Cheese.find(params[:id])
    end

    def update
        cheese = Cheese.find(params[:id])
        cheese.update(
            name: params[:name],
            style: params[:style],
            net_wt: params[:net_wt],
            milk_type: params[:milk_type],
            veg_rennet: params[:veg_rennet],
            raw: params[:raw]
        )
        redirect_to "/cheeses/#{cheese.id}"
    end
end