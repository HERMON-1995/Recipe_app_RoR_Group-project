class HomeController < ApplicationController
  def index
    render plain: 'Welcome to our app! This is the home page.'
    @current_user = current_user
  end
end
