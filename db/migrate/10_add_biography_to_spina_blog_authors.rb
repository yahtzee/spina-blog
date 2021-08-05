# frozen_string_literal: true

class AddBiographyToSpinaBlogAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :spina_blog_authors, :biography, :text, after: :email
  end
end
