class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
	#add_column :users, :salt, :string
  end
end
