class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :event_name
      t.string :event_type
      t.string :start_time
      t.string :end_time
      t.string :location
      t.string :vet_contact

      t.timestamps
    end
  end
end
