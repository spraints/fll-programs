class ApplicationController < ActionController::Base
  include CurrentUser
  include ApplicationHelper
  protect_from_forgery with: :exception
end
