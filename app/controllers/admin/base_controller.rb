class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  layout 'admin'

  private

  def admin_required!
    redirect_to root_path, alert: "You are not authorized to access this page!" unless current_user.is_a?(Admin)
  end
end