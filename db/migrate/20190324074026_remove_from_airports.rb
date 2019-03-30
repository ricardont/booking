class RemoveFromAirports < ActiveRecord::Migration[5.2]
 def change
  remove_column :airport, :type
  remove_column :airport, :source
 end
end
