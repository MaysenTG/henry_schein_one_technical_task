class AddRelationToReplies < ActiveRecord::Migration[7.0]
  def change
    add_reference :replies, :account, foreign_key: true
    add_reference :replies, :question, foreign_key: true
  end
end
