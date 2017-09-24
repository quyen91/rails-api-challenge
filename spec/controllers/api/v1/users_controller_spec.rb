require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  let!(:user) { FactoryGirl.create :user}

  describe 'api/v1/users' do
    context 'GET #index' do
      it 'assign users to @users' do
        get :index
        expect(assigns(:users)).to eq([user])
        expect(response).to have_http_status(200)
      end
    end

    context 'POST #register' do

    end
  end

end
