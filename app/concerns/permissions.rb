module Permissions
  def authorize
    puts current_user || "no current user"
  end
end