require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  # login_user

  let!(:user) {FactoryGirl.create :user}
  let!(:post) {FactoryGirl.create :post}

  it "should have a current_user" do
    expect(assigns(:current_user)).to_not eq(nil)
  end

  describe 'api/v1/posts' do
    context 'GET #index' do
      before {get :index}

      it "populates an array of @posts" do
         expect(assigns(:posts)).to eq([post])
         expect(response).to have_http_status(200)
      end
    end

    context 'GET #show' do
      before {get :show, params: { id: post.id} }

      it "assigns the requested post to @post" do
        expect(assigns(:post)).to eq(post)
        expect(response).to have_http_status(200)
      end
    end

    context 'POST #create' do
    end
  end

end
