class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :birthdate
<<<<<<< HEAD:db/migrate/20240819041913_create_dogs.rb
      t.integer :age
      t.text :allergies
      t.text :medical_history
      t.integer :BCS
=======
      t.string :allergies
      t.references :family, null: false, foreign_key: true
>>>>>>> master:db/migrate/20240819085010_create_dogs.rb

      t.timestamps
    end
  end
end
