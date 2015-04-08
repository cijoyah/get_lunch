class Promotion < ActiveRecord::Base

  belongs_to :user

  def self.active_promotion
    where("end_time > ?", Time.zone.now)
  end

end
