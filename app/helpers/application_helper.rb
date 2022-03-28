module ApplicationHelper

  def format_number num 
    number_with_precision num, :precision => 2, 
      :delimiter => ','
  end

  def compute_total stocks
    stocks.reduce(0) { |acc, stock| acc + (stock.cost_price * stock.shares) }
  end

  def format_date date_string 
    p date_string
    date = DateTime.parse(date_string)
    DateTime.strftime date, '%m %d, %Y'
  end

end
