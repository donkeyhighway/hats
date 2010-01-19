class YellowHat < ActiveRecord::Base
  default_scope :conditions => 'position >= 0'

  MAGIC_NUMBER = 50

  validates_uniqueness_of :position, :if => lambda{|hat| hat.visible?}
  validates_numericality_of :position
  validates_inclusion_of :position, :in => -1...MAGIC_NUMBER

  before_validation :randomize_position
  
  def randomize_position
    self.position ||= ((0...MAGIC_NUMBER).to_a - YellowHat.all.map(&:position)).rand
  end

  def visible?
    self.position >= 0
  end

  def hide!
    self.position = -1
    self.save!
  end

  def to_s
    self.body
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

