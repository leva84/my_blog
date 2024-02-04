describe ArticlesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    let(:articles) { create_list :article, 2 }

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

  describe 'GET #new' do
    subject { get :new }

    it 'returns correct http status' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders the new template' do
      expect(subject).to render_template(:new)
    end

    it 'assigns the new article' do
      subject
      expect(assigns(:article).is_a?(Article)).to be_truthy
    end
  end

  describe 'POST #create' do
    shared_examples :invalid_article_parameters do

      it 'returns correct http status' do
        expect(subject).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new article' do
        expect { subject }.not_to change(Article, :count)
      end

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end

      it 'returns errors of article' do
        subject
        expect(assigns(:article).errors).to be_present
      end
    end

    context 'with valid parameters' do
      subject { post :create, params: valid_params }

      let(:valid_params) { { article: attributes_for(:article) } }

      it 'returns correct http status' do
        expect(subject).to have_http_status(:redirect)
      end

      it 'creates a new article' do
        expect { subject }.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        expect(subject).to redirect_to(Article.last)
      end
    end

    context 'with invalid parameters' do
      subject { post :create, params: invalid_params }

      context 'when empty parameters' do
        context 'when empty title' do
          let(:invalid_params) { { article: { title: nil, summary: 'Summary', content: 'Content' } } }

          include_examples :invalid_article_parameters
        end

        context 'when empty summary' do
          let(:invalid_params) { { article: { title: 'Title', summary: nil, content: 'Content' } } }

          include_examples :invalid_article_parameters
        end

        context 'when empty content' do
          let(:invalid_params) { { article: { title: 'Title', summary: 'Summary', content: nil } } }

          include_examples :invalid_article_parameters
        end
      end

      context 'when long parameters 'do
        let(:invalid_value) { '1' * Article::MAXIMUM_LENGTH_VALUE + '1' }

        context 'when long title' do
          let(:invalid_params) { { article: { title: invalid_value, summary: 'Summary', content: 'Content' } } }

          include_examples :invalid_article_parameters
        end

        context 'when long summary' do
          let(:invalid_params) { { article: { title: 'Title', summary: invalid_value, content: 'Content' } } }

          include_examples :invalid_article_parameters
        end

        context 'when long summary' do
          let(:invalid_params) { { article: { title: 'Title', summary: 'Summary', content: invalid_value } } }

          include_examples :invalid_article_parameters
        end
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: article.id } }

    let(:article) { create(:article) }

    it 'returns correct http status' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders the edit template' do
      expect(subject).to render_template(:edit)
    end

    it 'assigns the correct article' do
      subject
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'PATCH #update' do
    let(:article) { create(:article) }

    shared_examples :invalid_article_parameters do
      it 'returns correct http status' do
        expect(subject).to have_http_status(:unprocessable_entity)
      end

      it 'does not update a article' do
        subject
        article.reload
        expect(article.send(attribute)).not_to eq(invalid_value)
      end

      it 'renders the new template' do
        expect(subject).to render_template(:edit)
      end

      it 'returns errors of article' do
        subject
        expect(assigns(:article).errors).to be_present
      end
    end

    context 'with valid parameters' do
      subject { patch :update, params: { id: article.id, article: valid_params[:article] } }

      let(:valid_params) { { article: { title: 'New Title' } } }

      it 'returns correct http status' do
        expect(subject).to have_http_status(:redirect)
      end

      it 'updates the article' do
        subject
        article.reload
        expect(article.title).to eq('New Title')
      end

      it 'redirects to the updated article' do
        expect(subject).to redirect_to(article)
      end
    end

    context 'with invalid parameters' do
      subject { patch :update, params: { id: article.id, article: invalid_params } }

      let(:attribute) { invalid_params.keys.first }

      context 'when empty parameters' do
        let(:invalid_value) { nil }

        context 'when empty title' do
          let(:invalid_params) { { title: invalid_value } }

          include_examples :invalid_article_parameters
        end

        context 'when empty summary' do
          let(:invalid_params) { { summary: invalid_value } }

          include_examples :invalid_article_parameters
        end

        context 'when empty content' do
          let(:invalid_params) { { content: invalid_value } }

          include_examples :invalid_article_parameters
        end
      end

      context 'when long parameters 'do
        let(:invalid_value) { '1' * Article::MAXIMUM_LENGTH_VALUE + '1' }

        context 'when long title' do
          let(:invalid_params) { { title: invalid_value } }


          include_examples :invalid_article_parameters
        end

        context 'when long summary' do
          let(:invalid_params) { { summary: invalid_value } }

          include_examples :invalid_article_parameters
        end

        context 'when long content' do
          let(:invalid_params) { { content: invalid_value } }

          include_examples :invalid_article_parameters
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: article.id } }

    let!(:article) { create(:article) }

    it 'returns correct http status' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'destroys the article' do
      expect { subject }.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles index' do
      expect(subject).to redirect_to(articles_path)
    end

    it 'deleted article from database' do
      subject
      expect(Article.exists?(article.id)).to be_falsey
    end
  end
end
