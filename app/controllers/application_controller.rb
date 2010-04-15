# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include Canable::Enforcers
  include Userstamp
  #include Permissions

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  delegate :can_view?, :to => :current_user
  helper_method :can_view? # so you can use it in your views
  hide_action :can_view?

  private
  def enforce_view_permission(resource)
    raise Canable::Transgression unless can_view?(resource)
  end
end
