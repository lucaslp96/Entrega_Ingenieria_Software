class CreateQuestionVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :good

      t.timestamps
    end
  end
end
