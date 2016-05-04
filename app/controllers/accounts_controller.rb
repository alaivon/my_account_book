class AccountsController < ApplicationController

	def index
		@account = Account.all
	end

	def show
		
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			redirect accounts_url, notice: "You"
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private





end
