module Admin
    class FaqEntriesController < Admin::ApplicationController
        before_action :set_faq_entry, only: %i[edit update destroy]

        def index
            authorize :admin, :manage_faq?
            @faq_entries = FaqEntry.order(:id)
            @faq_entry = FaqEntry.new
        end

        def create
            authorize :admin, :manage_faq?
            @faq_entry = FaqEntry.new(faq_entry_params)

            if @faq_entry.save
                redirect_to admin_faq_entries_path, notice: "Successfully created."
            else
                @faq_entries = FaqEntry.order(:id)
                render :index, status: :unprocessable_entity
            end
        end

        def edit
            authorize :admin, :manage_faq?
        end

        def update
            authorize :admin, :manage_faq?

            if @faq_entry.update(faq_entry_params)
                redirect_to admin_faq_entries_path, notice: "Successfully updated."
            else
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy
            authorize :admin, :manage_faq?
            @faq_entry.destroy
            redirect_to admin_faq_entries_path, notice: "Successfully deleted."
        end

        private

        def set_faq_entry
            @faq_entry = FaqEntry.find(params[:id])
        end

        def faq_entry_params
            params.require(:faq_entry).permit(:question, :answer)
        end
    end
end
