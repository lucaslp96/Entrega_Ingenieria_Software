class CreateQuestionCommentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :question_comment_reports do |t|
      t.integer :user_id
      t.integer :question_comment_id

      t.timestamps
    end
  end
end
