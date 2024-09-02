class AddInvitableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :invitation_token, :string
    add_column :users, :invited_by_id, :integer
    add_column :users, :invited_by_type, :string
    add_column :users, :invite_accepted_at, :datetime
    add_column :users, :invite_limit, :integer
  end
end
