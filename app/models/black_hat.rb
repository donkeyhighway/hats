class BlackHat < ActiveRecord::Base
  default_scope :conditions => 'position >= 0 and closed = "f"'

  MAGIC_NUMBER = 50

  validates_uniqueness_of :position, :if => lambda{|hat| hat.visible?}
  validates_numericality_of :position
  validates_inclusion_of :position, :in => -1...MAGIC_NUMBER

  before_validation :randomize_position
  
  def randomize_position
    self.position ||= ((0...MAGIC_NUMBER).to_a - BlackHat.all.map(&:position)).rand
  end

  def visible?
    self.position >= 0 && self.closed?
  end

  def hide!
    self.position = -1
    self.closed = true
    self.save!
  end

  def to_s
    self.body.to_s
  end

  def green_s
    return nil if (self.owner.to_s + self.green_hat.to_s).blank?
    self.owner.to_s + ": " + self.green_hat.to_s
  end

  def next
    BlackHat.find(:all, :conditions => ['id > ?', self.id]).first
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

