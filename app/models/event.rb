class Event < ActiveRecord::Base
  before_save :blank_to_zero
  has_many :relations
  has_many :users, :through => :relations

  validates :serial,  :presence => true, :uniqueness => true
  validates :name,    :presence => true
  validates :place,   :presence => true
  validates :address, :presence => true

  validate do
    return if self.url.blank?
    begin
      uri = URI.parse(self.url)
      unless %w(http https).include?(uri.scheme)
        errors.add(:url, "should be http or https")
      end
    rescue URI::InvalidURIError
      errors.add(:url, "is invalid")
    end
  end

  def to_param
    serial
  end

  def self.turnout_sum
    Event.all.reject { |e| e.turnout.blank? }.map(&:turnout).sum
  end

  private

  def blank_to_zero
    self.turnout = 0 if self.turnout.blank?
  end
end
