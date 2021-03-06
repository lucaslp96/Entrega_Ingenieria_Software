class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :visits
      t.integer :votes
      t.integer :numanswers

      t.integer :bestanswer, default: nil

      t.timestamps
    end
  end
end
