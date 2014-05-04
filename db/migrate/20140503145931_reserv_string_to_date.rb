class ReservStringToDate < ActiveRecord::Migration
  def change
  	change_column :reservations, :first_date, :date
  	change_column :reservations, :last_date, :date
  end
end
