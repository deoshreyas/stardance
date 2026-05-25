# == Schema Information
#
# Table name: faq_entries
#
#  id         :bigint           not null, primary key
#  answer     :text             not null
#  question   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FaqEntry < ApplicationRecord
  has_paper_trail

  validates :question, presence: true
  validates :answer, presence: true
end
