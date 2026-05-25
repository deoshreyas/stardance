class CreateFaqEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :faq_entries do |t|
      t.string :question, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
