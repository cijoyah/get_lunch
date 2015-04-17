class Promotion < ActiveRecord::Base

  belongs_to :user

  def self.active_promotion
    where("end_time > ?", Time.zone.now)
  end


  def active_promotion
    Time.now <= end_time && Time.now >= start_time
  end

  def total_of_promotions_sold
    buyers*price
  end


end
