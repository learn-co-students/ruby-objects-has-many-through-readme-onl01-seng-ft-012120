class Waiter
  @@all = []
  attr_reader :name, :experience
  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self,customer,total,tip)
  end

  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end

  def customers
    self.meals.collect{|meal| meal.customer}
  end

  def best_tipper
    best_tip = self.meals.max{|a, b| a.tip <=> b.tip }
    best_tip.customer

  end


  def self.all 
    @@all
  end


end