class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :breed
      t.integer :age
      t.float :height
      t.float :weight
      t.text :allergies
      t.text :medical_history

      t.timestamps
    end
  end
end
