class AddOrderToRow < ActiveRecord::Migration
  class Row < ActiveRecord::Base
  end

  def change
    add_column :rows, :order, :integer, default: 100
    Row.reset_column_information
    reversible do |dir|
      dir.up { Row.update_all order: 100 }
    end
  end
end
