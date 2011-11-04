class Relation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  scope :attendee, where(:attendee => true)
  scope :staff,    where(:staff    => true)
  scope :speaker,  where(:speaker  => true)
  scope :watcher,  where(:online   => true)
end
