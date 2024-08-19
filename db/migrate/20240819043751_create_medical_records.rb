class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :record_type
      t.text :description
      t.string :document_url
      t.string :appointment_date
      t.string :vet_contact
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
