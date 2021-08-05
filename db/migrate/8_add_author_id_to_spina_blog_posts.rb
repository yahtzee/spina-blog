# frozen_string_literal: true

class AddAuthorIdToSpinaBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :spina_blog_posts, :author, to_table: :spina_blog_authors

    say_with_time 'Assigning authors to their relevant posts' do
      Spina::Blog::Post.all.each do |post|
        author = Spina::Blog::Author.find_by(user_id: post.user_id, user_type: Spina::Blog.user_model)

        post.update_attribute :author_id, author.id
        post.save
      end
    end
  end
end
