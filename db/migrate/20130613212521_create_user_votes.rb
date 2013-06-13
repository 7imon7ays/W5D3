class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :voter_id
      t.integer :link_id
      t.boolean :upvote

      t.timestamps
    end
  end
end
