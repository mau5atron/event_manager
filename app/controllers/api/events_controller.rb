	class Api::EventsController < ApplicationController
		# this controller responds to json requests 
		respond_to :json

		def index
			respond_with Event.order(event_date: :DESC)
		end

		def show
			respond_with Event.find(params[:id])
		end

		def create
			respond_with :api, Event.create(event_params)
		end

		def destroy
			respond_with Event.destroy(params[:id])
		end

		def update
			event = Event.find(params['id'])
			event.update(event_params)
			respond_with Event, json: event
		end

		private 

		def event_params
			# permit these event properties to be updated / created,
			# defining which properties may be assigned
			params.require(:event).permit(
				:id,
				:event_type,
				:event_date,
				:title,
				:speaker,
				:host, 
				:published
			)
		end
	end