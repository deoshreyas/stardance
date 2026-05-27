module FaqPageManagement
  extend ActiveSupport::Concern

  included do
    before_action :set_faq_page
  end

  def edit
    authorize :faq_page
  end

  def update
    authorize :faq_page
    if @faq_page.update(faq_page_params)
        redirect_to faq_edit_path, notice: "Successfully updated."
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

  # Should be overriden by controllers
  def faq_edit_path
    raise NotImplementedError, "Must implement faq_edit_path in the controller"
  end
end
