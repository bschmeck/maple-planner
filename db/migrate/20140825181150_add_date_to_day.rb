class AddDateToDay < ActiveRecord::Migration[4.2]
  def change
    add_column :days, :date, :datetime
  end
end
