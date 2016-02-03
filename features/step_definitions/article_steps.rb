Given /^the following articles? exists?:$/ do |articles|
	articles.hashes.each do |article|
		Article.create! article
	end
end

And /^article "([^"]*)" has (\d+) comments?$/ do |title, comment_count|
	article = Article.find_by_title title
	comment_count.to_i.times do |x|
		article.add_comment({:body => "Comment #{x}"})
	end
end

And /^I fill in the merge field with "([^"]*)"$/ do |title|
    fill_in("merge_with", :with => Article.find_by_title(title).id)
end