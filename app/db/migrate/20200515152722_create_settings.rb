class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.boolean :is_insta, default: 0
      t.string  :display_mode, default: "NORMAL"

      t.timestamps
    end
  end
end
