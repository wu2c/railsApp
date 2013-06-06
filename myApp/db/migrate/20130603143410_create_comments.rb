class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :content
      t.references :newsarticle

      t.timestamps
    end
    add_index :comments, :newsarticle_id
  end
end
