ActiveAdmin.register Article do
  permit_params :title, :summary, :content

  form do |f|
    f.inputs do
      f.input :title
      f.input :summary
      f.input :content, as: :simplemde_editor
    end

    f.actions
  end
end
