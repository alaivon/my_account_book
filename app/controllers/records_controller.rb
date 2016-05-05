class RecordsController < ApplicationController
	before_action :find_record, except: [:new, :create, :index, :revenue_record, :expense_record]
	before_action :authenticate_user!

	def index
		@revenue_month_record  = current_user.records.past_month(1)
		@expense_month_record  = current_user.records.past_month(2)
		@revenue_year_record  = current_user.records.past_year(1)
		@expense_year_record  = current_user.records.past_year(2)

	end


	def revenue_record
		@revenue_record = current_user.records.find_type(1)
	end

	def expense_record
		@expense_record = current_user.records.find_type(2)
	end

	def new
		@record = current_user.records.build
	end

	def create
		@record = current_user.records.build(record_params)
		if @record.save
			redirect_to records_url, notice: "You add a new record successfully!"
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @record.update(record_params)
			redirect_to records_url, notice: "You modify the record completely!"
		else
			render :edit
		end
	end

	def destroy
		@record.destroy
		redirect_to records_url
	end

	private

	def find_record
		@record = current_user.records.find(params[:id])
	end

	def record_params
		params.require(:record).permit(:amount, :period, :info, :catagory_id)
	end




end

