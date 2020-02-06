require "pry"
class Customer
  
    @@all = []    

    def initialize(name, age)
        @age = age
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
   
    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        Meal.all.select {|meal| meal.customer == self}.map {|meal| meal.waiter}
    end
end
