class PagesController < ApplicationController
  def welcome
    @content  = PageContent.find_by(slug: "welcome_page")
    @events = Event.upcoming.limit(3)   # grab 3 upcoming events
    @products = Product.in_stock.limit(3) # grab 3 available products
  end

  def about
    @content = PageContent.find_by(slug: "about_page")
  end

  def services
    @content = PageContent.find_by(slug: "services_page")
  end
end
