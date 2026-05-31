class Admin::Support::FaqPageController < Admin::ApplicationController
    include FaqPageManagement

    private

    def faq_edit_path
        edit_admin_support_faq_page_path
    end
end
