class CreateFaqPages < ActiveRecord::Migration[8.1]
  def change
    create_table :faq_pages do |t|
      t.text :body, null: false

      t.timestamps
    end
  end
end
