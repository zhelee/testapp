class HomeController < ApplicationController
  def index
    flash[:notice] = "the user is delivered"
    User.delay.deliver 1
  end
end
