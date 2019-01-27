class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    eligible, message = rider_check
    update_user if eligible
    message
  end

  def rider_check
    eligible = true
    message = 'Sorry.'

    if user.tickets < attraction.tickets
      eligible = false
      message += " You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      eligible = false
      message += " You are not tall enough to ride the #{attraction.name}."
    end
    message = "Thanks for riding the #{attraction.name}!" if eligible
    [eligible, message]
  end

  def update_user
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
