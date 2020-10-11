require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :item_prices, :quantities

    
    def initialize(discount=nil, total=0)
        @total = total.to_f
        @discount = discount
        @items = []
        @item_prices = []
        @quantities = []
    end

    def add_item(title, price, quantity=1)
        self.total += price.to_f*quantity.to_f
        quantity.times {@items << title}
        quantity.times {@item_prices << price}
        @quantities << quantity
    end

    def apply_discount
        if self.discount == nil
            return "There is no discount to apply."
        end
        d = self.discount.to_f/100.0
        new_total = self.total*(1.0-d)
        
        self.total = new_total
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        quantity = @quantities.pop
        quantity.times {@items.pop}
        last_trans = item_prices.pop
        quantity.times {self.total -= last_trans}
        self.total
    end




end

