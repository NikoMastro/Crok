class ChangeFamilyInDogs < ActiveRecord::Migration[7.1]
  def change
    change_column_null :dogs, :family_id, true
  end
end
