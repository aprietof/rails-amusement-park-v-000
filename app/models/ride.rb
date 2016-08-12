class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def user_tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def not_tall_enouugh_message
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def user_has_enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def not_enough_tickets_message
    "You do not have enough tickets the #{self.attraction.name}."
  end

  def go_ahead!
    self.user.tickets = self.user.tickets - self.attraction.tickets
    self.user.happiness += self.attraction.happiness_rating
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
    "Thanks for riding the #{self.attraction.name}!"
  end

  def take_ride
    if self.user_tall_enough? && self.user_has_enough_tickets?
      self.go_ahead!
    elsif !self.user_has_enough_tickets? && !self.user_tall_enough?
      "Sorry. " + self.not_enough_tickets_message + " " + self.not_tall_enouugh_message 
    elsif !self.user_tall_enough?
      "Sorry. " + self.not_tall_enouugh_message
    elsif !self.user_has_enough_tickets?
      "Sorry. " + self.not_enough_tickets_message
    end
  end
end
