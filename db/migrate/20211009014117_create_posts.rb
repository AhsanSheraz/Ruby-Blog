class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :context
      t.string :user_ip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end