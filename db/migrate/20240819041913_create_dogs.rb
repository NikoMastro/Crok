class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :birthdate
      t.integer :age
      t.text :allergies
      t.text :medical_history
      t.integer :BCS

      t.timestamps
    end
  end
end
