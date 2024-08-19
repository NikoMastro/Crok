class CreateHealthTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :health_tracks do |t|
      t.integer :weight
      t.integer :height
      t.integer :bcs
      t.date :date
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
