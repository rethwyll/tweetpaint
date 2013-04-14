class AddOAuthToHandles < ActiveRecord::Migration
  def change
    add_column :handles, :consumer_key, :string
    add_column :handles, :consumer_secret, :string
    add_column :handles, :oauth_token, :string
    add_column :handles, :oauth_token_secret, :string
  end
end