require "pry"

class CashRegister

    attr_accessor :total, :discount, :last_transaction


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @@mainarray = []
    end

    


    def add_item( title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        previous_total = total
        @last_transaction = price * quantity
        newArray = Array.new(quantity){|title| title = @title}
        @total = last_transaction + total
        @@mainarray << newArray

    end


    def apply_discount
        if discount > 0
            discount = 1 - ((@discount.to_f) / 100)
            @total = total * discount
            return "After the discount, the total comes to $#{total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @@mainarray.flatten
    end
    
    def void_last_transaction
        @total = total - self.last_transaction

    end
    
end
