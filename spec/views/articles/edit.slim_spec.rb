describe 'articles/edit', type: :view do
  let(:article) { create(:article) }

  before do
    assign(:article, article)
    render
  end

  it "renders the 'Back to articles' button" do
    expect(rendered).to match(articles_path)
  end

  it "renders the 'Show this article' button" do
    expect(rendered).to match(article_path(article))
  end

  it 'renders partial _form' do
    expect(rendered).to render_template(partial: '_form')
  end

  it 'renders the new article form' do
    expect(rendered).to match("<form action=\"/articles/#{ article.id }\"")
    expect(rendered).to match(/<label class="form-label" for="article_title">/)
    expect(rendered).to match(/<label class="form-label" for="article_summary">/)
    expect(rendered).to match(/<label class="form-label" for="article_content">/)
    expect(rendered).to match(/<input type="submit" name="commit" value="Save" class="btn btn-primary btn-sm"/)
  end
end
