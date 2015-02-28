ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Pictures" do
          ul do
            Picture.order('created_at desc').limit(50).each do |picture|
              li link_to(picture.name, admin_picture_path(picture))
            end
          end
        end
      end

      column do
        panel "Recent Comments" do
          ul do
            Comment.order('created_at desc').limit(50).each do |c|
              li link_to(c.body, admin_user_comment_path(c.id))
            end
          end
        end
      end
    end
  end # content
end
