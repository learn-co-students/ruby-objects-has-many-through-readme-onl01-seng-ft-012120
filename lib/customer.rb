class Customer
  attr_accessor :name, :age 
  
  @@all = [] 
  
  def initialize(name, age)
    @name = name 
    @age = age 
    save  
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    return @@all 
  end 
  
  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end 
  
  def meals 
    return Meal.all.select do |meal|
      meal.customer == self 
    end 
  end 
  
  def waiters
    return meals.collect do |meal|
      meal.waiter
    end 
  end 
end