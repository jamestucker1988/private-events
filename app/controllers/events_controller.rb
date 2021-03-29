class EventsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.where.not(name: @event.creator.name)
  end

  def invite
    @event = Event.find(params[:id])
    @event.attendees << User.where.not(name: @event.creator.name)
    redirect_to current_user
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
