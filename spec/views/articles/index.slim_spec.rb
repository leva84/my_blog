describe 'articles/index', type: :view do
  let(:articles) { create_list(:article, 3) }

  before do
    assign(:articles, articles)
    render
  end

  it 'renders a list of articles' do
    articles.each do |article|
      expect(rendered).to match(/#{ article.title }/)
      expect(rendered).to match(/#{ article.summary }/)
      expect(rendered).to match(article_path(article))
      expect(rendered).to render_template(partial: '_preview_article')
    end
  end

  it "renders the 'Back to articles' button" do
    expect(rendered).to match(articles_path)
  end
end
