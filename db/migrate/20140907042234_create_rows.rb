class CreateRows < ActiveRecord::Migration[4.2]
  def change
    create_table :rows do |t|
      t.string :name, null: false
      t.integer :year_id

      t.timestamps
    end
  end
end
