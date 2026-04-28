class CreateYears < ActiveRecord::Migration[4.2]
  def change
    create_table :years do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
