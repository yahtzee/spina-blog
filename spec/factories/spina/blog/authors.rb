# frozen_string_literal: true

FactoryBot.define do
  factory :spina_blog_author, class: Spina::Blog::Author do
    sequence(:display_name) { |n| "Author #{n}" }
  end
end
