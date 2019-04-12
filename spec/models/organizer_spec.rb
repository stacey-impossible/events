# == Schema Information
#
# Table name: organizers
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

require 'rails_helper'

RSpec.describe Organizer, type: :model do
  fixtures :organizers

  it 'is valid with valid attributes' do
    expect(organizers(:one)).to be_valid
  end

  it 'is not valid without valid attributes' do
    organizer = Organizer.new
    expect(organizer).to_not be_valid
    expect(organizer.errors.keys).to match_array %i[title]
  end
end
