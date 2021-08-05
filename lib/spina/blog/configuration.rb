# frozen_string_literal: true

module Spina
  # Spina::Blog
  module Blog
    include ActiveSupport::Configurable

    config_accessor :title, :controller, :description, :spina_icon, :plugin_type, :user_model

    self.title = 'Blog'
    self.controller = 'blog'
    self.description = 'Blog posts'
    self.spina_icon = 'pencil-outline'

    self.plugin_type = 'website_resource'

    self.user_model = 'Spina::User'
  end
end
