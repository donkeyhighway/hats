require File.join(File.dirname(__FILE__), '../test_helper')

class YellowHatTest < ActiveSupport::TestCase
  test "yellowhat machinist" do
    assert_nothing_raised{YellowHat.make}
  end

  test "default scope doesn't show anything with negative position" do
    YellowHat.make_unsaved(:position => -1).save
    assert YellowHat.all.empty?, "found a yellowhat with a negative position"
  end

  test "position can't go above 50" do
    assert_raises(ActiveRecord::RecordInvalid){YellowHat.make(:position => 101)}
  end

  test "position checks for uniqueness" do
    YellowHat.make(:position => 5)
    assert_raises(ActiveRecord::RecordInvalid){YellowHat.make(:position => 5)}
  end

  test "yellowhats are randomly positioned" do
    yh = YellowHat.new
    yh.save!
    assert yh.position >= 0
    assert yh.position <= 50
  end

  test "can make up to 50 yellowhats without blowing up" do
    assert_nothing_raised{50.times{YellowHat.make(:position => nil)}}
  end

  test "can have more than one negative YellowHat" do
    assert_nothing_raised do
      YellowHat.make_unsaved(:position => -1).save!
      YellowHat.make_unsaved(:position => -1).save!
    end
  end
end


# == Schema Information
#
# Table name: yellow_hats
#
#  id         :integer         not null, primary key
#  body       :text
#  sprint_id  :integer
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

