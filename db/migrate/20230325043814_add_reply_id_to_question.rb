class AddReplyIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer_reply_id, :integer
  end
end
