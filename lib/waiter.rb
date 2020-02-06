class Waiter

    @@all = []    

    def initialize(name, yrs_xp)
        @name = name
        @yrs_xp = yrs_xp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
       self.meals.max_by { |meal| meal.tip}.customer
       
      
    end
end