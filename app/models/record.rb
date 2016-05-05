class Record < ApplicationRecord
	belongs_to :user
	belongs_to :catagory
	validates :amount, presence: true
	validates :amount, numericality: {greater_than_or_equal_to: 1}, allow_blank: true



	scope :past_month, ->(catagory_id) {where(catagory_id: catagory_id, period: (Time.now.beginning_of_month..Time.now.end_of_month))}

	scope :past_year, ->(catagory_id) {where(catagory_id: catagory_id, period: (Time.now.beginning_of_year..Time.now.end_of_year))}


	def self.total_amount
		sum(:amount)
	end

end


# def self.included(base)
# 		base.extend(MonthData)
# 		base.class_eval do
# 			scope :search, ->(period) {where(["period LIKE ?", "%#{period}%"])}
# 		end
# 	end

# 	module MonthData


# 		def past_data	
# 			where(period: (Time.now.beginning_of_month..Time.now.end_of_month))
# 		end

# 		def this_year_data
# 			where(period: (Time.now.beginning_of_year..Time.now.end_of_year))
# 		end

# 		def set_date
# 			pluck(:period).collect{|date| date.strftime("%Y-%m")}.uniq!
# 		end
