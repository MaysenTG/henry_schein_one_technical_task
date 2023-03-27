class AddUsernameToDeviseAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :username, :string, null: false
    add_index :accounts, :username, unique: true
  end
end
