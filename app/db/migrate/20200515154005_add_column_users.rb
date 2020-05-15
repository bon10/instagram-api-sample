class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username,       :string
    add_column :users, :follower_count, :integer
    add_column :users, :follow_count,   :integer
    add_column :users, :insta_token,    :string
    add_column :users, :insta_id,       :string
  end
end
