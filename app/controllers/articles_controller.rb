class ArticlesController < ApplicationController
  respond_to :html
  responders :flash

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    @article = Article.find(params[:id])

    respond_with(@article)
  end

  def new
    @article = Article.new

    respond_with(@article)
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      respond_with(@article, location: article_path(@article))
    else
      respond_with(@article)
    end
  end

  def edit
    @article = Article.find(params[:id])

    respond_with(@article)
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      respond_with(@article, location: article_path(@article))
    else
      respond_with(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :summary, :content)
  end
end
