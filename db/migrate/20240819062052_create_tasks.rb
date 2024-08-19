class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :status
      t.string :start_time
      t.string :end_time
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
