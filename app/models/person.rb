class Person < ActiveRecord::Base
  def name
    "%s %s. %s." % [last_name, first_name && first_name.first, middle_name && middle_name.first]
  end
end
