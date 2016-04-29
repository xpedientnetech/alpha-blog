class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :comment_desc, presence: true, length: { minimum: 5}
end