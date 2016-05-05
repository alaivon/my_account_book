Rails.application.routes.draw do
  devise_for :users
	resources  :records
		get 'revenue' => 'records#revenue_record'
		get 'expense' => 'records#expense_record'
	root 'records#index'	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
