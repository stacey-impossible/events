require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    fixtures :events

    it 'returns a successful response' do
      get :show, params: { id: events(:valid).id }
      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    fixtures :admins

    it 'returns success with auth' do
      sign_in(admins(:one), scope: :admin)
      get :new
      expect(response).to be_successful
    end

    it 'redirects to login without auth' do
      get :new
      expect(response).to redirect_to :new_admin_session
    end
  end

  describe 'POST create' do
    fixtures :events, :admins

    it 'should not create event without auth' do
      post :create, params: { event: events(:valid) }
      expect(response).to redirect_to :new_admin_session
    end

    it 'should accept valid params' do
      sign_in(admins(:one), scope: :admin)
      post :create, params: { event: events(:valid).attributes }
      expect(response).to redirect_to event_url(assigns(:event))
    end

    it 'should not create event with invalid params' do
      sign_in(admins(:one), scope: :admin)
      post :create, params: { event: events(:invalid).attributes }
      expect(response).to render_template(:new)
    end
  end
end
