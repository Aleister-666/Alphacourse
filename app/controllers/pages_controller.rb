class PagesController < ApplicationController
  def home
    render :home, layout: false
  end
end
