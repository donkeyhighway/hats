class CreateYellowHats < ActiveRecord::Migration
  def self.up
    create_table :yellow_hats do |t|
      t.text :body
      t.integer :sprint_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :yellow_hats
  end
end
