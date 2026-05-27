module Helper
    class FaqPageController < ApplicationController
        include FaqPageManagement

        private

        def faq_edit_path
            edit_helper_faq_page_path
        end
    end
end
