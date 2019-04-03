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

class Event < ApplicationRecord
  validates :title, :city, :address, :start_time, presence: true
end
