# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  city        :string
#  description :text
#  start_time  :datetime
#  address     :string
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'do not create invalid model' do
    e = Event.new
    e.save

    assert_equal e.errors.keys, [:title, :city, :address, :start_time]
  end
end
