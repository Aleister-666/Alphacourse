class PagesController < ApplicationController
  def home
    render :home, layout: false
  end

  def about
    render :about, layout: false
  end

end
