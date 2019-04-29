class CreateAirlines < ActiveRecord::Migration[5.2]
  def change
    create_table :airlines do |t|
      t.string :iata
      t.string :name
      t.string :logo_sm
      t.string :logo_md
      t.string :logo_lg

      t.timestamps
    end
  end
end
