module FaqPageManagement
  extend ActiveSupport::Concern

  included do
    before_action :set_faq_page
  end

  def edit
    authorize_faq!
  end

  def update
    authorize_faq!
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
  def authorize_faq!
    raise NotImplementedError, "Must implement authorize_faq! in the controller"
  end

  def faq_edit_path
    raise NotImplementedError, "Must implement faq_edit_path in the controller"
  end
end
