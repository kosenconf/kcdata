class Event < ActiveRecord::Base
  validates :serial, :presence => true, :uniqueness => true
  validates :name,   :presence => true

  def to_param
    serial
  end
end
