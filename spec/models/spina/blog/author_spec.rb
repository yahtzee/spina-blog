# frozen_string_literal: true

require 'rails_helper'

module Spina::Blog
  RSpec.describe Author, type: :model do
    let(:author) { build(:spina_blog_author) }

    subject { author }

    it { is_expected.to be_valid }
    it { expect { author.save }.to change(Spina::Blog::Author, :count).by(1) }
  end
end
