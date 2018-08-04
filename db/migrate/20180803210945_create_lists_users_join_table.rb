class CreateListsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lists, :users do |t|
      t.index :list_id
      t.index :user_id
    end
  end
end
