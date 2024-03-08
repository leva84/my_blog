class UpdateUserNicknameAttribute < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :nickname, :string, limit: 8
    add_index :users, :nickname, unique: true
  end

  def down
    remove_index :users, :nickname
    change_column :users, :nickname, :string
  end
end
