class CreateHeights < ActiveRecord::Migration[7.1]
  def change
    create_table :heights do |t|
      t.float :height
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
