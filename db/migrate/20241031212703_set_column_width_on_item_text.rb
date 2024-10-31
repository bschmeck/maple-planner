class SetColumnWidthOnItemText < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :text, :string, limit: 1_048_576
  end
end
