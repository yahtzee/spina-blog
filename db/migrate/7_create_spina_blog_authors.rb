# frozen_string_literal: true

class CreateSpinaBlogAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_authors do |t|
      t.bigint :user_id
      t.string :user_type
      t.string :display_name, null: false
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end

    add_index :spina_blog_authors, [:user_id, :user_type], unique: true

    say_with_time 'Creating author records for post authoring users' do
      user_ids = Spina::Blog::Post.select('DISTINCT user_id').map(&:user_id)
      user_model = Spina::Blog.user_model

      user_model.constantize.find(user_ids).each do |user|
        Spina::Blog::Author.find_or_create_by(user_id: user.id, user_type: user_model) do |author|
          author.display_name = user.name
        end
      end
    end
  end
end
