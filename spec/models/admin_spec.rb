# == Schema Information
#
# Table name: admins
#
#  id                  :bigint(8)        not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  fixtures :admins

  it 'is valid with valid attributes' do
    expect(admins(:one)).to be_valid
  end

  it 'is not valid without valid attributes' do
    admin = Admin.new
    expect(admin).to_not be_valid
    expect(admin.errors.keys).to match_array %i[email password]
  end
end
