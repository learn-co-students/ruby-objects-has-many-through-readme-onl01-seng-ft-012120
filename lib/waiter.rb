class Waiter
    attr_reader :name
    attr_accessor :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_meal(customer, total, tip=0)
        waiter_new_meal = Meal.new(self, customer, total, tip)
    end


    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        highest_meal_tip = meals.max do |meal_one, meal_two|
            meal_one.tip <=> meal_two.tip
        end
        highest_meal_tip.customer
    end

end 