# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < Admin::BaseController
  def index
    @events_count = Event.count
    @products_count = Product.count
    @users_count = User.count
  end
end
