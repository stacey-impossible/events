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

class Organizer < ApplicationRecord
  has_many :events

  validates :title, presence: true
end
