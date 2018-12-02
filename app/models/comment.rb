class Comment < ApplicationRecord
  belongs_to :post #may not need to belong to post?
  belongs_to :user
end
