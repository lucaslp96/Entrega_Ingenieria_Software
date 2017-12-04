class CreatePermits < ActiveRecord::Migration[5.1]
  def change
    create_table :permits do |t|
      t.string :action
      t.integer :required_points

      t.timestamps
    end
  end
end
