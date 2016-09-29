class AddNbViewToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :nb_view, :integer
  end
end
