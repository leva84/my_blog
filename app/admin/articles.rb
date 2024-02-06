ActiveAdmin.register Article do
  permit_params :title, :summary, :content
end
