xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title @user.username, "'s ", @giftlist.giftlist_name
		xml.description @giftlist.description
		xml.link "http://localhost:3000/", @user.username, "/", @giftlist.giftlist_name

		for gift in @gifts
			xml.item do
				xml.title gift.name
				xml.description gift.description
        xml.pubDate gift.created_at.to_s(:rfc822)
				xml.link gift.url
			end
		end
	end
end
