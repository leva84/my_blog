class ArticlesController < ApplicationController
  inherit_resources

  respond_to :html

  actions :index, :show, :create, :new, :edit, :update, :destroy

  def create
    create! do |_, failure|
      failure.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
    update! do |_, failure|
      failure.html { render :edit, status: :unprocessable_entity }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :summary, :content)
  end
end
