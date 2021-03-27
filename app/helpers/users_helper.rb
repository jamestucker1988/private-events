module UsersHelper
	def created_events(user, name, events, title)
		render partial: name, locals: { obj: events, title: title } if user.events.size.positive?
	end
end
