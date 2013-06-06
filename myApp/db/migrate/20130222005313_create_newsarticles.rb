class CreateNewsarticles < ActiveRecord::Migration
  def change
    create_table :newsarticles do |t|
      t.string :name
      t.string :title
      t.text :article

      t.timestamps
    end
  end
end
