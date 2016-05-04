class BuildTwoKindToCatagory < ActiveRecord::Migration[5.0]

  def up   #建立revenue expense兩個類別
  	kinds = %w(Revenue, Expense)
  	kinds.each do |kind|
  		Catagory.create(kind: kind)
  	end
  end




  def down
  	kinds = Catagory.all
  	kinds.destroy_all
  end
end
