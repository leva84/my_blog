class ArticlesController < ApplicationController
  inherit_resources

  respond_to :html

  actions :index, :show, :create, :new, :edit, :update, :destroy

  private

  def article_params
    params.require(:article).permit(:title, :summary, :content)
  end
end
