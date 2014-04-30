class RenameClientName < ActiveRecord::Migration

  def up
  	rename_column :clients, :"first Name", :first_name
  	rename_column :clients, :"last Name", :last_name
  end

  def down
  	rename_column :clients, :last_name, :"last Name"
  	rename_column :clients, :first_name, :"first Name" 
  end

end
