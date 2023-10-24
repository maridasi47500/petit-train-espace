class CreateMytweets < ActiveRecord::Migration[7.0]
  def change
    create_table :mytweets do |t|
      t.string :content
      t.integer :hashtag_id
      t.string :tweet_id

      t.timestamps
    end
  end
end
