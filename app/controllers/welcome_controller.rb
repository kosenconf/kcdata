class WelcomeController < ApplicationController
  def index
    @events = Event.order("date ASC")
    @users  = User.order("created_at DESC")
  end
end
