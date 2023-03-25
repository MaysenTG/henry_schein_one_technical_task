class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title, :null =>  false
      t.text :body, :null =>  false
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.boolean :has_accepted_answer, default: false
      
      t.timestamps
    end
  end
end
