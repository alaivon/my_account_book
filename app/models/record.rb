class Record < ApplicationRecord
	belongs_to :user
	belongs_to :catagory
	validates :amount, presence: true
	validates :amount, numericality: {greater_than_or_equal_to: 1}, allow_blank: true

	scope :find_type, ->(catagory_id) {where(catagory_id: catagory_id)}

	scope :past_month, ->(catagory_id) {where(catagory_id: catagory_id, period: (Time.now.beginning_of_month..Time.now.end_of_month))}

	scope :past_year, ->(catagory_id) {where(catagory_id: catagory_id, period: (Time.now.beginning_of_year..Time.now.end_of_year))}

	scope :earliest_date, ->(catagory_id) {find_type(catagory_id).order('period ASC').first.period} 

	def self.total_amount
		sum(:amount)
	end

	def self.type_find(id)
		where(catagory_id: id)
	end

end


