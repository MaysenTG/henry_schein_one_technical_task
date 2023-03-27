class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.integer :account_id, :null => false
      t.integer :question_id, :null => false
      
      t.string :reaction_type, :null => false
      
      t.timestamps
    end
  end
end
