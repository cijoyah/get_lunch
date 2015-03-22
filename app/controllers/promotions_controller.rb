class PromotionsController < ApplicationController

    def index
    end

    def create
      @promotion = Promotion.new(promotions_params)
    end

    def new
      @promotion = Promotion.new
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
      params.require(:promotion).permit(:pitch, :description, :price, :available_on_date, :start_time, :end_time, :cuisine, :hotness)
    end

end
