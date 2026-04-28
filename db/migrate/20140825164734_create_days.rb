class CreateDays < ActiveRecord::Migration[4.2]
  def change
    create_table :days do |t|
      t.string :name
      t.integer :week_id
      t.timestamps
    end
  end
end
