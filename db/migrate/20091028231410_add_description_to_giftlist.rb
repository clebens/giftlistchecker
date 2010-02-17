class AddDescriptionToGiftlist < ActiveRecord::Migration
  def self.up
		add_column :giftlists, :description, :text
  end

  def self.down
		remove_column :giftlists, :description
  end
end
