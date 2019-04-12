# == Schema Information
#
# Table name: events
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  city         :string
#  description  :text
#  start_time   :datetime
#  address      :string
#  link         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cover        :string
#  organizer_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  include CarrierWave::Test::Matchers
  fixtures :events, :organizers

  it 'is valid with valid attributes' do
    expect(events(:valid)).to be_valid
  end

  it 'is not valid without valid attributes' do
    expect(events(:invalid)).to_not be_valid
    expect(events(:invalid).errors.keys).to match_array %i[title city organizer
                                                           start_time address]
  end

  it 'show_cover returns default cover if it is empty' do
    expect(events(:valid).show_cover).to match '/empty_cover.jpg'
  end

  it 'uploads cover' do
    event = events(:valid)
    event.cover.store!(File.open('spec/fixtures/test.png'))
    expect(event.show_cover).to match '/uploads/*'
  end

  it 'start_time_humanize returns correct format' do
    expect(events(:valid).start_time_humanize).to match '\d{2}.\d{2}.\d{2} \d{2}:\d{2}'
  end
end
