class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :username 
      t.string  :comment
      t.timestamps
    end
  end
end
