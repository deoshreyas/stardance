module Admin
    class FaqPageController < Admin::ApplicationController
        before_action :set_faq_page

        def edit
            authorize :admin, :manage_faq?
        end

        def update
            authorize :admin, :manage_faq?

            if @faq_page.update(faq_page_params)
                redirect_to edit_admin_faq_page_path, notice: "Successfully updated."
            else
                render :edit, status: :unprocessable_entity
            end
        end

        private

        def set_faq_page
            @faq_page = FaqPage.instance
        end

        def faq_page_params
            params.require(:faq_page).permit(:body)
        end
    end
end
