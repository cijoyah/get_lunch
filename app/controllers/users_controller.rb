class UsersController < ApplicationController

    def index
      @user = User.all
    end

    def show
      @user = User.find(params[:id])
      @active_promotions = @user.promotions.active.order("created_at DESC")
      @expired_promotions = @user.promotions.expired.order("created_at DESC")
      
      @total_sum_of_all_sales = 0
      @user.promotions.each do |promo|
        @total_sum_of_all_sales = @total_sum_of_all_sales + promo.price * promo.buyers
      end
            @sale_count = @user.promotions.length

    end

    private
  
end
