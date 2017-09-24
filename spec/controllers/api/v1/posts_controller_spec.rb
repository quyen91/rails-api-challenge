require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  # login_user

  let!(:user) {FactoryGirl.create :user}
  let!(:post) {FactoryGirl.create :post}
  let!(:post_json) {{
                      id: post.id,
                      title: post.title,
                      content: post.content,
                      user: {
                        id: post.user.id,
                        username: post.user.username
                      },
                      newest_comments: []
                    }}

  # it "current_user should be set as last user" do
  #   # expect(assigns(:current_user)).to eq(user)
  # end

  describe 'GET #index' do
     before {get :index}

      it "populates an array of @posts" do
         expect(assigns(:posts)).to eq([post])
         expect(response).to have_http_status(200)
      end

      it 'List all available posts with correct json' do
        expect(response.body).to eq([post_json].to_json)
      end

  end

  describe 'GET #show' do
    before {get :show, params: { id: id} }

    context 'when id does not exist' do
      let(:id) { 'argh' }

      it 'should be 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when finding by id' do
      let(:id) { post.id }

      it 'render correct json of post' do
         expect(response.body).to eq(post_json.to_json)
      end
    end
  end

end
