require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    fixtures :organizers

    it 'returns a successful response' do
      get :show, params: { id: organizers(:one).id }
      expect(response).to be_successful
    end
  end
end
