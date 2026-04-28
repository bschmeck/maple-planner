class AddRowIdToItem < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :row_id, :integer
  end
end
