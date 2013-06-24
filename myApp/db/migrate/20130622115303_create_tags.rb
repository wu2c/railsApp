class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagname
      t.references :newsarticle

      t.timestamps
    end
    add_index :tags, :newsarticle_id
  end
end
