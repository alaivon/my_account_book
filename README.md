# README
Hi, I'm Bill, this is one of projects for my exercise, Accounting Book!
We could record our cash flow to help save money in this appilication.

## User Story
1. As a user, I want to add a new record.
	- As a user, there are two types I can choose, Revenue or Expense.
	- As a user, I could enter data, amount and details about my new record.

2. As a user, I want to know the total of this month and this year in root page.

3. As a user, I could view my all records and total from the earlist date
 .
	- As a user, I could view 10 records per page.

## Gem

- [will_paginate](https://github.com/mislav/will_paginate)

- [faker](https://github.com/stympy/faker), A library for generating fake data


## Model
- Catagory kind:string (因為type在rails是保留字，改用type)

- Record amount:integer, period:date, info:string, catagory_id:integer

- User for devise


## Notes
- 測試帳戶： admin@test.com,  admin1234。

- 使用`rake db:records`指令和faker建立資料。
```ruby
namespace :db do
	desc "use faker to generate data"
	task :records => :environment do
		30.times do |n|
			amount = Faker::Number.between(1, 10)
			period = Faker::Date.between_except(1.year.ago, 1.month.from_now, Date.today)
			info = Faker::Lorem.word #=> "repellendus"
				Record.create(amount: amount, info: info, period: period, catagory_id: 2, user_id: User.last.id)
		end
	end
end
```

- 利用helper & scope 來簡潔或修改重複或的程式碼
	```ruby
		# 顯示record的加總
		def render_total_amount(record) 
			number_to_currency(record.total_amount)
		end
		
		# 顯示最早的紀錄
		def render_earliest_date(record, id)
			record.earliest_date(id)
		end

	```
	```ruby
		# app/record.rb
	  scope :find_type, ->(catagory_id) {where(catagory_id: catagory_id)}

		def self.total_amount
			sum(:amount)
		end
	```

- beginning_of_year(month) & end_of_year(month)
	ActiveSupport::CoreExtensions::Date::Calculations底下有很多date的操作方法
  上述兩個也在其中
		```
			Time.now.beginning_of_year(month) 可以撈出現在時間的起始年(月)
			=> 2016-01-01 00:00:00 +0800

			Time.now.beginning_of_month
			=> 2016-05-01 00:00:00 +0800
		```

- 呈現的資料可以依照金額＆日期排序，[Sortable Table Columns](http://railscasts.com/episodes/228-sortable-table-columns)


