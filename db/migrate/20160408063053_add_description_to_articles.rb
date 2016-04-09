class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
    add_column :articles, :create_at, :datetime
    add_column :articles, :update_at, :datetime
  end
end
