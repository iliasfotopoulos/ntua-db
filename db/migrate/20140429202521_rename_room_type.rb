class RenameRoomType < ActiveRecord::Migration

  def up
  	rename_column :rooms, :type, :room_type
  end

  def down
  	rename_column :rooms, :room_type, :type
  end


end
