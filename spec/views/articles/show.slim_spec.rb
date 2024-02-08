describe 'articles/show', type: :view do
  let(:article) { create(:article, title: 'Title', summary: 'Summary', content: 'Content') }

  before do
    assign(:article, article)
    render
  end

  it 'renders attributes' do
    expect(rendered).to match(/#{ article.title }/)
    expect(rendered).to match(/#{ article.content }/)
  end

  it 'renders partial _article' do
    expect(rendered).to render_template(partial: '_article')
  end

  it 'does not renders attributes' do
    expect(rendered).not_to match(/#{ article.summary }/)
  end

  it "renders the 'Back to articles' button" do
    expect(rendered).to match(articles_path)
  end
end
