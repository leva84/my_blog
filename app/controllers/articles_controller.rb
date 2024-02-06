class ArticlesController < ApplicationController
  respond_to :html
  responders :flash

  before_action :set_article, only: %i[show new create edit update destroy]

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    respond_with(@article)
  end

  def create
    if @article.save
      respond_with(@article, location: article_path(@article))
    else
      respond_with(@article)
    end
  end

  def edit
    respond_with(@article)
  end

  def update
    if @article.update(article_params)
      respond_with(@article, location: article_path(@article))
    else
      respond_with(@article)
    end
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :summary, :content)
  end

  def set_article
    @article = if params[:action] == 'new'
                 Article.new
               elsif params[:action] == 'create'
                 Article.new(article_params)
               else
                 Article.find(params[:id])
               end
  end
end
