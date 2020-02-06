class Meal

    attr_accessor :customer, :waiter
    attr_reader :tip

    @@all = []

    def initialize(waiter, customer, total, tip)
        @waiter = waiter
        @total = total
        @customer = customer
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
end