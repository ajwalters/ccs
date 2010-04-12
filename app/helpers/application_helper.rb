# Methods added to this helper will be available to all templates in the application.

module ApplicationHelper
  def authorize?
    logger.debug current_user || "no current user"
    logger.info  "2 this is driving me crazy "
    logger.debug  "3 this is driving me crazy "
    true
  end

  def signed_in?
    return false if current_user.nil?
    current_user.signed_in?
  end

  def admin?
    return false if current_user.nil?
    current_user.admin?
  end

  def admin_only!(&block)
    #todo check if the currently logged in user is an admin
    #if so, display the block, otherwise hide it
    if not admin? then
      match, file, line = caller.first.match(/([^:]+):(\d+).+/).to_a
      Rails.logger.debug " *** hiding administrative content. #{line} in #{file}"
    end
  end

  def signed_in_only!(&block)
    #todo check if the currently logged in user is signed in
    #if so, display the block, otherwise hide it
    if not signed_in? then
      match, file, line = caller.first.match(/([^:]+):(\d+).+/).to_a
      Rails.logger.debug " *** hiding sign_in required content. #{line} in #{file}"
    end
  end
end
