class CreateTags < ActiveRecord::Migration
  def change
  if (!ActiveRecord::Base.connection.tables.include?("tags"))
    create_table :tags do |t|
      t.string :tagname
      t.references :newsarticle

      t.timestamps
    end
	end
    
  end
end
