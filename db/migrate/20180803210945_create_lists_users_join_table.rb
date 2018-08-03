class CreateListsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    # This is enough; you don't need to worry about order
    create_join_table :lists, :users

    # If you want to add an index for faster querying through this join:
    create_join_table :lists, :users do |t|
      t.index :list_id
      t.index :user_id
    end
  end
end
