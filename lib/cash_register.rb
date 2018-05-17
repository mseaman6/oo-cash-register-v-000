
class CashRegister

  attr_accessor :total, :old_total, :discount, :items

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @old_total = @total
    if quantity != 1
      item_total = price * quantity
      @total = @total + item_total
      quantity.times do
        @items << item
      end
    else
      @total = @total + price
      @items << item
    end
  end


  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      discounted_amount = @total * @discount / 100
      @total = @total - discounted_amount
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total = @old_total
  end

end
