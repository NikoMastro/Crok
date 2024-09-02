class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.references :family, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
