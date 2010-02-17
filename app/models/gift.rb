class Gift < ActiveRecord::Base
	def self.find_user_gifts(user_id)
		find(:all, :conditions => ["user_id = ?", params[:id]])
	end

end
