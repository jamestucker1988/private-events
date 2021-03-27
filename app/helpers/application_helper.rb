module ApplicationHelper
	def show_sign_in_out
		out = ''
		if logged_in?
			out << link_to('My Profile', user_path(session[:user_id]))
			out << link_to('Sign out', logout_path, method: :delete)
		else
			out << link_to('login', sign_in_path)
			out << link_to('Sign up', new_user_path)
		end

		out.html_safe
	end
end
