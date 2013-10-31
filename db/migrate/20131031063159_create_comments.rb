class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :user
    	t.string :post
    	t.text :body 
      t.timestamps
    end
  end
end