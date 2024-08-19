class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.boolean :status
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
