class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :points, default: 0
      t.integer :university_id

      t.timestamps
    end
  end
end
