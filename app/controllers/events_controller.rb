class EventsController < ApplicationController
	before_action :require_user, except: [:index]

	def index
		
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
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :location, :date)
	end
end