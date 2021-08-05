# frozen_string_literal: true

module Spina
  module Admin
    module Blog
      # Spina::Admin::Blog::AuthorsController
      class AuthorsController < AdminController
        before_action :author, except: %i[new create index]
        before_action :set_breadcrumb
        before_action :set_locale
        
        admin_section :blog

        decorates_assigned :author

        def index
          @authors = Spina::Blog::Author.order(:display_name)
        end

        def new
          @author = Spina::Blog::Author.new
          add_breadcrumb I18n.t('spina.blog.authors.new')
          render layout: 'spina/admin/admin'
        end

        def create
          @author = Spina::Blog::Author.new author_params
          if @author.save
            redirect_to spina.edit_admin_blog_author_url(@author.id),
                        notice: t('spina.blog.authors.saved')
          else
            add_breadcrumb I18n.t('spina.blog.authors.new')
            render :new, status: :unprocessable_entity
          end
        end

        def edit
          add_breadcrumb @author.display_name
          render layout: 'spina/admin/admin'
        end

        def update
          add_breadcrumb @author.display_name
          if @author.update(author_params)
            redirect_to spina.edit_admin_blog_author_url(
              @author.id, params: { locale: @locale }
            ), notice: t('spina.blog.authors.saved')
          else
            render :edit, status: :unprocessable_entity
          end
        end

        def destroy
          @author.destroy
          redirect_to spina.admin_blog_authors_path
        end

        private

        def set_breadcrumb
          add_breadcrumb I18n.t('spina.blog.authors.name'),
                         spina.admin_blog_authors_path
        end

        def author
          @author = Spina::Blog::Author.find(params[:id])
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
          I18n.locale = @locale
        end

        def author_params
          params.require(:author)
                .permit(:display_name, :first_name, :last_name, :email, :user_id)
                .merge(user_type: Spina::Blog.user_model)
        end
      end
    end
  end
end
