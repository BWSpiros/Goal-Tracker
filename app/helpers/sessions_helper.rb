module SessionsHelper

  def current_user
    return nil if session[:token].nil?
    User.find_by_session_token(session[:token])
  end

end
