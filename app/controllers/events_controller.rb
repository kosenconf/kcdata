# -*- coding: utf-8 -*-
class EventsController < ApplicationController
  before_filter :require_sign_in, :only => [:new, :edit, :create, :update, :destroy]

  def index
    @events = Event.order("date")
    @events_for_graph = @events.map { |event|
      {
        :serial  => event.serial,
        :turnout => event.turnout
      }
    }

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.find_by_serial(params[:id])
    @title = @event.name

    if signed_in?
      @relation = Relation.find_by_event_id_and_user_id(@event, current_user)
      @relation ||= Relation.new(:event => @event, :user => current_user)
    end

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def edit
    @event = Event.find_by_serial(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "開催情報が追加されました！ありがとうございます！" }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find_by_serial(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: "開催情報が更新されました！" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find_by_serial(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
