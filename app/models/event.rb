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

  def self.apply_filters(organizer_id, city, query)
    filtered = all
    filtered = filtered.coming if query == 'coming'
    filtered = filtered.past if query == 'past'
    filtered = filtered.where(organizer_id: organizer_id) if organizer_id.present?
    filtered = filtered.where(city: city) if city.present?
    filtered
  end

  def as_ics
    cal = Icalendar::Calendar.new
    cal.event do |e|
      e.dtstart = start_time
      e.summary = title
      e.description = description
    end
    cal
  end
end
