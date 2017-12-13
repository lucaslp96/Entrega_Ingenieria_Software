class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.integer :question_uses

      t.timestamps
    end
  end
end
