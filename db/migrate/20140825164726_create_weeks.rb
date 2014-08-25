class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :number
      t.datetime :start_date
      t.integer :year_id
      t.timestamps
    end
  end
end
