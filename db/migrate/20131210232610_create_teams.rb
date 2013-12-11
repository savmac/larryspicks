class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :abbreviation
      t.string :type

      t.timestamps
    end
  end
end
