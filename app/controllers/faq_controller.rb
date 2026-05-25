
class FaqController < ApplicationController
  def index
    @faq_page = FaqPage.first
    @body_class = "faq-page"
  end
end
