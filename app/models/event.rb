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

class Event < ApplicationRecord
  belongs_to :organizer
  mount_uploader :cover, CoverUploader
  self.per_page = 4
  CITIES = %w[Rostov-on-Don Taganrog Azov].freeze

  validates :title, :city, :address, :start_time, presence: true
  validates :city, inclusion: { in: CITIES }

  scope :coming, -> { where('start_time > ?', DateTime.now) }
  scope :past, -> { where('start_time <= ?', DateTime.now) }

  def show_cover
    return '/empty_cover.jpg' if cover.blank?
    cover.url
  end

  def start_time_humanize
    start_time.strftime('%d.%m.%y %H:%M')
  end
end
