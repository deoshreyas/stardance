module Helper
    class FaqPageController < ApplicationController
        include FaqPageManagement

        private

        def authorize_faq!
            authorize :helper, :manage_faq?
        end

        def faq_edit_path
            edit_helper_faq_page_path
        end
    end
end
