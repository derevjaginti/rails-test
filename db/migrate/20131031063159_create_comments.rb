class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :user, :null => false 
      t.string :post, :null => false
      t.text :body, :null => false 
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
