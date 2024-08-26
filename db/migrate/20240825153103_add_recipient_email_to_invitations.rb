class AddRecipientEmailToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :receipient_email, :string
    add_reference :invitations, :user, null: false, foreign_key: true
    add_column :invitations, :has_secure_token, :string
  end
end
