module RecordsHelper


	def render_total_amount(record)
		number_to_currency(record.total_amount)
	end


end
