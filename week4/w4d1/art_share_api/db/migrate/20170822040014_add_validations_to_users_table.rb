class AddValidationsToUsersTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username, :string
    add_column :users, :username, :string
    change_column_null :users, :username, false
    add_index :users, :username, unique: true
  end
end
