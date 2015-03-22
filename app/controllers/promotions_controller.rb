class PromotionsController < ApplicationController

    before_action :find_promotion, only: [:show, :edit, :update, :destroy]

    def index
      @promotions = Promotion.all.order("created_at DESC")
    end

    def show
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
      if @promotion.update(promotion_params)
        redirect_to @promotion
      else
        render 'edit'
      end
    end

    def destroy
      @promotion.destroy
      redirect_to root_path
    end

    private

    def find_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:pitch, :description, :price, :available_on_date, :start_time, :end_time, :cuisine, :hotness)
    end

end
