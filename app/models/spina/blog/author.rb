# frozen_string_literal: true

# Spina Blog Author
#
# The author is a profile object for the creator of a post, this is optionally linked to the user
module Spina
  module Blog
    # Spina::Blog::Author
    class Author < ApplicationRecord
      include Spina::Gravatar

      belongs_to :user, optional: true, polymorphic: true

      has_many :posts, class_name: 'Spina::Blog::Post', inverse_of: :author

      validates :display_name, presence: true

      delegate :to_s, to: :display_name

      alias_attribute :name, :display_name
    end
  end
end
