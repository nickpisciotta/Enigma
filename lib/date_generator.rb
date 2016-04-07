require 'Date'

class DateGenerator
  attr_reader :date

  def initialize(date = nil)
    if date.nil?
      @date = generate_date
    else
      @date = given_date(date)
    end
  end

  def given_date(date)
    squared_date = date.to_i ** 2
    date_last_digits = squared_date.to_s[-6..-1]
  end

  def generate_date
    squared_date = Date.today.strftime("%d%m%y").to_i ** 2
    date_last_digits = squared_date.to_s[-6..-1]
  end

end
