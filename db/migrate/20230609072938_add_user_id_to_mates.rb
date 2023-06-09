class AddUserIdToMates < ActiveRecord::Migration[7.0]
  def change
    add_column :mates, :user_id, :integer
    add_index :mates, :user_id
  end
end
