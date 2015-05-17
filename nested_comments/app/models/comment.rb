class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC', dependent: delete_all
end
