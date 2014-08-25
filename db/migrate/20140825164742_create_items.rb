class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :text
      t.string :url
      t.integer :day_id
      t.integer :grade
      t.timestamps
    end
  end
end
