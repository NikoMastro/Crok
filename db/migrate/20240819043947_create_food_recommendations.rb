class CreateFoodRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :food_recommendations do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :food_name
      t.string :brand
      t.text :description
      t.string :recommended_quantity
      t.string :available
      t.string :purchase_link
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
