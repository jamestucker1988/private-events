module ApplicationHelper
  def show_sign_in_out
    out = ''
    if logged_in?
      out << link_to(current_user.name, user_path(session[:user_id]))
      out << '</br>'
      out << link_to('Sign out', logout_path, method: :delete)
    else
      out << link_to('login', sign_in_path)
      out << '</br>'
      out << link_to('Sign up', new_user_path)
    end

    out.html_safe
  end
end
