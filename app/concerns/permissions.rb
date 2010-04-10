module Permissions
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


end