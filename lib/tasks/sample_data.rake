namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		user = User.first
		50.times do
			name = Faker::Lorem.words(2).join(" ")
			producttype = Faker::Lorem.words(2).join(" ")
			subcategory = Faker::Lorem.words(2).join(" ")
			category = Faker::Lorem.words(2).join(" ")
			description = Faker::Lorem.words(50).join(" ")
			price = ((200.0 - 5.0) * rand() + 5).round(2)
		#	user.listings.create!(name: name, producttype: producttype, subcategory: subcategory, category: category, description: description, price: price)
		end
		users = User.all(limit: 6)
    	50.times do
      		SubjectTitle = Faker::Lorem.sentence(5)
      		users.each { |user| user.messages.create!(subjectTitle: SubjectTitle) }
		end
	end
end
