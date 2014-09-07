class AddRowIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :row_id, :integer
  end
end
