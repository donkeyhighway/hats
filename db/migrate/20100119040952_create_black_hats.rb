class CreateBlackHats < ActiveRecord::Migration
  def self.up
    create_table :black_hats do |t|
      t.text :body
      t.text :green_hat
      t.string :owner
      t.integer :position
      t.boolean :closed

      t.timestamps
    end
  end

  def self.down
    drop_table :black_hats
  end
end
