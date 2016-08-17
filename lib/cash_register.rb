require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :transactions 
 
  def initialize(d = 0)
    @total = 0
    @discount = d
    @items = []
    @transactions = []
  end

  def add_item(title, price, quant = 1)
    quant.times do 
      @items << title
    end

    p = price.to_f
    q = quant.to_i
    new_total = @total + (p * q)
    self.total = new_total.round(2)
    transactions << self.total
    self.total
  end

  def apply_discount
    if @discount > 0
      p = self.discount / 100
      self.total = (@total * ((100.0 - self.discount) / 100))
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
    # d = (@discount / 100)
    # t = self.total
    # new_total = t - (t * d)
    # # 1000 - (1000 * 20/100)
    # self.total = new_total
    # new_total



  # def items
  #   @@all
  # end
# binding.pry

  def void_last_transaction
    self.total = self.total - @transactions.pop
    self.total
  end


end