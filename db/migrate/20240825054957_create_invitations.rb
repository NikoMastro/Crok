class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :receipient_email
      t.references :user, null: false, foreign_key: true
      t.string :has_secure_token

      t.timestamps
    end
  end
end
