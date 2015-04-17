class UsersController < ApplicationController

    def index
      @user = User.all
    end

    def show
      @user = User.find(params[:id])
      @promotions = @user.promotions.where('end_time >= ?' , Time.now).where('start_time <= ?' , Time.now)
      @total_sum_of_all_sales = 0
      @user.promotions.each do |promo|
        @total_sum_of_all_sales = @total_sum_of_all_sales + promo.price * promo.buyers
      end
            @sale_count = @user.promotions.length

    end

    private
  
end
