class PagesController < ApplicationController
  def home
    session[:user_id] = nil
  end
end
