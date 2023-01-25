class Students::ArticlesController < ApplicationController
  before_action :authenticate_user!

  layout 'workstation'

  def index
    filtered = Article.where('title ILIKE ?', "%#{params[:title]}%")
    @pagy, @articles = pagy(filtered.all, items: 15)
  end

  def show
    @article = Article.find(params[:id])
  end
  
end
