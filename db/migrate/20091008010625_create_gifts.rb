class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.integer :user_id, :null => false
      t.integer :giftlist_id, :null => false
      t.decimal :price, :precision => 8, :scale => 2
      t.string :url
      t.text :description
      t.integer :num_purchased
      t.integer :num_requested

      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
