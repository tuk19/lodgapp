module ApplicationHelper
    def sidebar_link_item(name, path)
        class_name = 'channel'
        class_name << ' active' if current_page?(path)

        content_tag :li, class:class_name do
            link_to name, path
        end
    end

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
end
