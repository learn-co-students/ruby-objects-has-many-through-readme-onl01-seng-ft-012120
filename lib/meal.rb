class Meal
  @@all = []

  attr_accessor :customer, :waiter, :total, :tip
  def initialize(waiter, customer, total, tip)
    self.customer = customer
    self.waiter = waiter
    self.total= total
    self.tip = tip
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
end