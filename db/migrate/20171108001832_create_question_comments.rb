class CreateQuestionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :question_comments do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :content

      t.timestamps
    end
  end
end
