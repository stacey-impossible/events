require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  describe 'POST create' do
    it 'should accept valid params' do
      expect{ post :create, params: { subscriber: { email: 'test@test.com' } } }.
        to change{Subscriber.count}.from(0).to(1)
      expect(response.content_type).to be_eql 'text/javascript'
    end

    it 'should not create event with invalid params' do
      expect{ post :create, params: { subscriber: { email: '' } } }.
        not_to change{Subscriber.count}
      expect(response.content_type).to be_eql 'text/javascript'
    end
  end
end
