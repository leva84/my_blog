class ArticlesController < InheritedResources::Base
  private

  def article_params
    params.require(:article).permit(:title, :summary, :content)
  end
end
