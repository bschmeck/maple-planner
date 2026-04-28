class AddUserIdToYear < ActiveRecord::Migration[4.2]
  def change
    add_column :years, :user_id, :integer
  end
end
