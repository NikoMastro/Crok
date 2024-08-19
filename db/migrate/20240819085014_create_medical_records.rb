class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records do |t|
      t.text :description
      t.date :date
      t.string :vet_contact
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
