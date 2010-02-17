class AddHiddenToGiftlist < ActiveRecord::Migration
  def self.up
		add_column :giftlists, :hidden, :integer
  end

  def self.down
		remove_column :giftlists, :hidden  
	end
end
