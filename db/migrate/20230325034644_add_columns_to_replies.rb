class AddColumnsToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :body, :text
  end
end
