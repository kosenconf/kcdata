class Event < ActiveRecord::Base
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
end
