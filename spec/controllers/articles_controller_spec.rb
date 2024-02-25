describe ArticlesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    let!(:articles) { create_list :article, 2 }

    it 'returns correct http status' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(subject).to render_template(:index)
    end

    it 'assigns article collection' do
      subject
      expect(assigns(:articles)).to match_array(articles)
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: article.id } }

    let(:article) { create(:article) }

    it 'returns correct http status' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(subject).to render_template(:show)
    end

    it 'assigns the correct article' do
      subject
      expect(assigns(:article)).to eq(article)
    end
  end
end
