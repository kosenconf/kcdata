class Event < ActiveRecord::Base
  def to_param
    serial
  end
end
