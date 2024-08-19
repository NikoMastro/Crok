class CreateWeights < ActiveRecord::Migration[7.1]
  def change
    create_table :weights do |t|
      t.float :weight
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
