class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :members
  end
end
