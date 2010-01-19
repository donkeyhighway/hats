require 'test_helper'

class SprintTest < ActiveSupport::TestCase
  test "creating sprint knocks all yellow hats to position nil" do
    20.times{YellowHat.make}
    assert_difference('YellowHat.count', -20) do
      Sprint.create!
    end
  end

  test "sprint machinist" do
    assert_nothing_raised{Sprint.make}
  end
end

# == Schema Information
#
# Table name: sprints
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

