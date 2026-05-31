# == Schema Information
#
# Table name: faq_pages
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FaqPage < ApplicationRecord
  has_paper_trail

  validates :body, presence: true

  def self.instance
    find_or_create_by!(id: 1) do |page|
      page.body = "No FAQ content yet!"
    end
  end

  before_validation :force_singleton_id, on: :create

  private

  def force_singleton_id
    self.id = 1
  end
end
