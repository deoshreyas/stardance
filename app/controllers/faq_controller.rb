class FaqController < ApplicationController
  def index
    @hide_sidebar = true
    @faq_page = FaqPage.first
    @body_class = "faq-page"
  end
end
