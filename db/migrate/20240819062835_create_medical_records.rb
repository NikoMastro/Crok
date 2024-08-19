class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records do |t|
      t.references :dog, null: false, foreign_key: true
      t.text :description
      t.string :document_url
      t.string :date
      t.string :vet_contact

      t.timestamps
    end
  end
end
