module RecordsHelper


	def render_total_amount(record)
		number_to_currency(record.total_amount)
	end

	def render_earliest_date(record, id)
		record.earliest_date(id)
	end


end
