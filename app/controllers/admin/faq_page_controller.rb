module Admin
    class FaqPageController < Admin::ApplicationController
        include FaqPageManagement

        private

        def authorize_faq!
            authorize :admin, :manage_faq?
        end

        def faq_edit_path
            edit_admin_faq_page_path
        end
    end
end
