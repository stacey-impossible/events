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

require 'test_helper'

class OrganizerTest < ActiveSupport::TestCase
  test 'do not create invalid model' do
    o = Organizer.new
    o.save

    assert_equal o.errors.keys, %i[email password title]
  end

  test 'do not create model with duplicated email' do
    o = organizers(:two)
    o.email = organizers(:one).email
    o.save

    assert_equal o.errors.keys, %i[email]
  end
end
