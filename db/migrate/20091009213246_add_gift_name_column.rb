class AddGiftNameColumn < ActiveRecord::Migration
  def self.up
		add_column :gifts, :name, :string
  end

  def self.down
		remove_column :gifts, :name
  end
end
