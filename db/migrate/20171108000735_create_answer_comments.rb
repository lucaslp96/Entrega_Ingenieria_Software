class CreateAnswerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comments do |t|
      t.integer :user_id
      t.integer :answer_id
      t.text :content

      t.timestamps
    end
  end
end
