module CurrentUser
  def self.included(base)
    base.helper_method :current_user, :signed_in?
  end

  def current_user
    @current_user ||= User.first
  end

  def signed_in?
    current_user.present?
  end
end
