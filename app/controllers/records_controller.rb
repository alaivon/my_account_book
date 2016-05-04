class RecordsController < ApplicationController
	before_action :find_record, except: [:new, :create, :index]

	def index
		@records = Record.all
	end


	def new
		@record = Record.new
	end

	def create
		@record = Record.new(record_params)
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
		@record = Record.find(params[:id])
	end

	def record_params
		params.require(:record).permit(:amount, :period, :info, :catagory_id)
	end




end

