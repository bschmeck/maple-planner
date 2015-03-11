class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :code, null: false, unique: true
      t.string :description
      t.datetime :expiration
      t.integer :year_id

      t.timestamps
    end
  end
end
