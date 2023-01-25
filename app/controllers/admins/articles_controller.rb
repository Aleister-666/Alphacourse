class Admins::ArticlesController < ApplicationController
	before_action :authenticate_user!
  before_action :authenticate_admin!

  before_action :set_article, except: %i[ new create index ]

  layout 'workstation'

  def index
    filtered = Article.where('title ILIKE ?', "%#{params[:title]}%")
    @pagy, @articles = pagy(filtered.all, items: 15)
  end

  def show; end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)

  	respond_to do |format|
  		if @article.save
  			format.html { redirect_to admins_article_path(@article), notice: 'Articulo Creado' }
  		else
  			format.html { render :new, status: :unprocessable_entity }
  		end
  	end
  end

  def edit; end

  def update
  	respond_to do |format|
  		if @article.update(article_params)
  			format.html { redirect_to admins_article_path(@article), notice: 'Articulo Actualizado' }
  		else
  			format.html { render :edit, status: :unprocessable_entity }
  		end
  	end
  end


  def destroy
  	@article.destroy
  	
  	redirect_to admins_articles_path, notice: 'Articulo Eliminado'
  end

  private

  def article_params
  	params.require(:article).permit(:title, :content)
  end

  def set_article
  	@article = Article.find(params[:id])
  end
end