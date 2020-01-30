class Waiter
    attr_accessor :name, :yrs_experience
    @@all = []
    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all<< self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal1, meal2|
            meal1.tip <=> meal2.tip 
        end
        best_tipped_meal.customer
    end

    def most_frequent_customer
        new_array = []
        meals.each do |meal|
            new_array << meal.customer
        end
        new_array.mode 
    end


    def worst_tipper
        worst_tipped_meal = meals.min do |meal1, meal2|
            meal1.tip <=> meal2.tip 
        end
        worst_tipped_meal.customer
    end

    def self.avg_tip_most_experienced_waiter
        most_experienced_waiter = self.all.max do |waiter1, waiter2|
            waiter1.yrs_experience <=> waiter2.yrs_experience
        end
        total = 0
        most_experienced_waiter.meals.each do |meal|
            total += meal.tip
        end
        total / most_experienced_waiter.meals.length
    end

    #     new_array = []
    #     Meal.all.map do |meal|
    #         new_array = meal.waiter.yrs_experience
    #     end
    #     most_experienced_waiter = new_array.reverse![0]
    #     total = 0 
    #     most_experienced_waiter.meals.map do |meal1|   
    #         total += meal1.tip
    #     end
    #     total / most_experienced_waiter.meals.length 
    # end



    def self.avg_tip_least_experienced_waiter
        least_experienced_waiter = self.all.min do |waiter1, waiter2|
            waiter1.yrs_experience <=> waiter2.yrs_experience
        end
        total = 0
        least_experienced_waiter.meals.each do |meal|
            total += meal.tip
        end
        total / least_experienced_waiter.meals.length
    end
    




end