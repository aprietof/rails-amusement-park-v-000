class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides
  # validates_inclusion_of :nausea, :happiness, :in => 1..5, :message => "has to be between 1 and 5"
  # validates_presence_of :nausea, :happiness

  def mood
    self.happiness - self.nausea > 0 ? "happy" : "sad" if !self.happiness.nil? && !self.nausea.nil?
  end

  def admin?
    self.admin
  end

end
