class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :content
      t.integer :numberOfVotes
      t.integer :numberOfComments
      t.integer :numberOfReports

      t.timestamps
    end
  end
end
