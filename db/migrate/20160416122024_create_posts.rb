class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :preview
      t.text :content
      t.boolean :announcement, default: false
      t.boolean :best, default: false

      t.timestamps null: false
    end
  end
end
