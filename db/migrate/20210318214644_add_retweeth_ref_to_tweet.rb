class AddRetweethRefToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweets, :integer
  end
end
