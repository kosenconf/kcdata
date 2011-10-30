class WelcomeController < ApplicationController
  def index
    @events = Event.order("date ASC")
  end
end
