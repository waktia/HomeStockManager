module ItemsHelper
  def limit_day(stock, days)
    today = Date::today
    @limit_days = today + (stock/100*days).days
  end
end
