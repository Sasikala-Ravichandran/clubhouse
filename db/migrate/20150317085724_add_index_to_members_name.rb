class AddIndexToMembersName < ActiveRecord::Migration
  def change
  	add_index :members, :name, unique: true
  end
end
