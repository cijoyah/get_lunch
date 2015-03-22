class PromotionsController < ApplicationController

    def index
    end
    def show
      @promotion = Promotion.find(params[:id])
    end

    def create
      @promotion = Promotion.new(promotion_params)
      if @promotion.save
        redirect_to @promotion
      else
        render 'new'
      end
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

    def promotion_params
      params.require(:promotion).permit(:pitch, :description, :price, :available_on_date, :start_time, :end_time, :cuisine, :hotness)
    end

end
