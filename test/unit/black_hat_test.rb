require 'test_helper'

class BlackHatTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: black_hats
#
#  id         :integer         not null, primary key
#  body       :text
#  green_hat  :text
#  owner      :string(255)
#  position   :integer
#  closed     :boolean
#  created_at :datetime
#  updated_at :datetime
#

