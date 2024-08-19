class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :birthdate
      t.integer :age
      t.text :allergies
      t.text :medical_history

      t.timestamps
    end
  end
end
