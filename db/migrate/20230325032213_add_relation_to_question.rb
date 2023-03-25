class AddRelationToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :account, foreign_key: true
  end
end
