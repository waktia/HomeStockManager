module ItemsHelper
  def limit_day(stock, days)
    today = Date::today
    @limit_days = today + (stock.to_f/100*days).days
  end
end
