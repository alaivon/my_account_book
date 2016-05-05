namespace :db do
	desc "use faker to generate data"
	task :records => :environment do
		30.times do |n|
			amount = Faker::Number.between(1, 10)
			period = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
			info = Faker::Lorem.word #=> "repellendus"
				Record.create(amount: amount, info: info, period: period, catagory_id: 2, user_id: 1)
		end
	end
end