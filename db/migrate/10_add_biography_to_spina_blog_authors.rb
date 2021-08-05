# frozen_string_literal: true

class AddBiographyToSpinaBlogAuthors < ActiveRecord::Migration[5.0]
  def change
    remove_column :spina_blog_posts, :user_id
  end
end
