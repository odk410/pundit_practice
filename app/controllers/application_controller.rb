class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def user_not_authorized
    flash[:notice] = "해당 기능을 수행할 권한이 없습니다."
    redirect_to(request.referrer || root_path)
  end
end
