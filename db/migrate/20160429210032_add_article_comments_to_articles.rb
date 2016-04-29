class AddArticleCommentsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_comment_id, :integer
  end
end
