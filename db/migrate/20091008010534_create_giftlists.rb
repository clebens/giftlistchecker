class CreateGiftlists < ActiveRecord::Migration
  def self.up
    create_table :giftlists do |t|
      t.integer :user_id, :null => false
      t.string :giftlist_name, :default => "My Giftlist"

      t.timestamps
    end
  end

  def self.down
    drop_table :giftlists
  end
end
