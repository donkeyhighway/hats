class Sprint < ActiveRecord::Base
  after_create :hide_yellow_hats

  def hide_yellow_hats
    YellowHat.update_all('position=-1')
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

