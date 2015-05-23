module ActiveAdmin::DatetimeHelper
  def default_date_options
    { as: :date_select, start_year: 1930, end_year: 2030 }
  end
end