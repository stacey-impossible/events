# == Schema Information
#
# Table name: subscribers
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it 'is valid with valid attributes' do
    expect(Subscriber.new(email: 'test')).to be_valid
  end

  it 'is not valid without valid attributes' do
    subscriber = Subscriber.new
    expect(subscriber).to_not be_valid
    expect(subscriber.errors.keys).to match_array %i[email]
  end
end
