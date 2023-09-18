class RemoveUserIdFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :user_id, :integer
  end
end
