class AddRankingToGift < ActiveRecord::Migration
  def self.up
		add_column :gifts, :ranking, :integer
  end

  def self.down
		remove_column :gifts, :ranking
  end
end
