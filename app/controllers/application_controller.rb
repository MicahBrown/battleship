class ApplicationController < ActionController::Base
  before_action :require_user

  def self.current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(uuid: session[:uuid]) if session[:uuid].present?
  end
  helper_method :current_user

  private

    def require_user
      redirect_to(login_path) unless current_user
    end
end
