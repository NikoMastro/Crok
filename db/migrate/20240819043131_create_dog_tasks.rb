class CreateDogTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_tasks do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :task
      t.string :status
      t.string :due_date
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
