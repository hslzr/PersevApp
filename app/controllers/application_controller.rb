class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_account

  protected

  def current_user
    @current_user ||= super && 
      User.includes(:account, :group).find(@current_user.id)
  end

  def current_account
    @current_account ||= current_user.account
  end
end
