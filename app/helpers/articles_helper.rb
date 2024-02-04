module ArticlesHelper
  def action_method
    if params[:action] == 'new'
      :post
    else
      :patch
    end
  end
end
