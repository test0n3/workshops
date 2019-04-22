class ApplicationController < ActionController::Base
  include Pundit

  def current_user
    # DON'T
    # DO
    # THIS
    User.find_by(role: params[:role])
  end
end
