class CreateAnswerCommentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comment_reports do |t|
      t.integer :user_id
      t.integer :answer_comment_id

      t.timestamps
    end
  end
end
