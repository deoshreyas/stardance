class FaqController < ApplicationController
  def index
    @faq_entries = FaqEntry.order(:id)
    @body_class = "page-faq"
  end
end
