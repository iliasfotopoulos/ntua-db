class RenameReservationsFirstLastDate < ActiveRecord::Migration
  def change
  	rename_column :reservations, :first_date, :arrival_date
  	rename_column :reservations, :last_date, :departure_date
  end
end
