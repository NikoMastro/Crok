class CreateUserSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :calendar_sync, default: true
      t.boolean :email_notifications, default: false
      t.boolean :data_export_option, default: false

      t.timestamps
    end
  end
end
