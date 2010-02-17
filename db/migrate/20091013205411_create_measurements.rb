class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.integer :user_id
      t.string :tshirt_size
      t.integer :waist
      t.integer :inseam
      t.integer :shoe_size
      t.integer :hat_size
      t.string :dress_shirt_size
      t.string :bust_size
      t.integer :dress_size
      t.integer :hip_size

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
