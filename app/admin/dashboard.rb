ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Recent Posts' do
          ul do
            Article.all.map do |article|
              li link_to(article.title, admin_article_path(article))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Info' do
          para 'Welcome to ActiveAdmin.'
          para 'Your system information:'
          ul do
            li "Ruby version: #{ RUBY_VERSION }"
            li "Rails version: #{ Rails.version }"
            li "ActiveAdmin version: #{ ActiveAdmin::VERSION }"
          end
        end
      end
    end
  end
end
