class HomeController < ApplicationController
 before_filter :authenticate_user!
 #####3 this will open the home page
  def index
  end
end
