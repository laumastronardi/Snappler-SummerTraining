class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows, force: :cascade do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end
  end
end
