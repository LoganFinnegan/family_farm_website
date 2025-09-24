class PagesController < ApplicationController
  def welcome
    @events = Event.upcoming.limit(3)   # grab 3 upcoming events
    @products = Product.in_stock.limit(3) # grab 3 available products
  end

  def about;end

  def services;end
end
