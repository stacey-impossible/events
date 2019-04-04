# == Schema Information
#
# Table name: organizers
#
#  id                  :bigint(8)        not null, primary key
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  email               :string
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#

class Organizer < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_many :events

  validates :title, :email, presence: true
  validates :email, uniqueness: true
end
