class CreateUserInteractions < ActiveRecord::Migration[7.1]
  def change
    create_table :user_interactions do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :interaction_type
      t.string :content

      t.timestamps
    end
  end
end
