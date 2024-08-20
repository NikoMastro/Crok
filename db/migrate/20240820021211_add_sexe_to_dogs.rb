class AddSexeToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :sexe, :string
  end
end
