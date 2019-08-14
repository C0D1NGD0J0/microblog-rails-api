20.times do |x|
	Article.create!(title: "Article-#{x}", content: "Lorem-#{x} ipsum dolor sit amet, consectetur adipisicing elit. Debitis nihil velit pariatur, voluptates, inventore alias. Quos rem ad, consequuntur at----#{x}.", image_url: "https://picsum.photos/400/300", user_id: 1)
	puts "#{x} article created";
end