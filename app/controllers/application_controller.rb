class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  private

  def authentificate_user!
    unless current_user
      session[:destination_path] = request.env['PATH_INFO']
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session['user_id']) if session['user_id']
  end

  def logged_in?
    !!current_user
  end
end
