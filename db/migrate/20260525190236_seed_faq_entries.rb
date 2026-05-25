class SeedFaqEntries < ActiveRecord::Migration[8.1]
  FAQ_ENTRIES = [
    {
      question: "Who is eligible?",
      answer: "Stardance is for highschoolers! You need to be 13-18 years old to participate."
    },
    {
      question: "How much does it cost?",
      answer: "100% free* - all the prizes are donated to us or paid for by us! (*customs might occur outside of the US)"
    },
    {
      question: "What types of projects count?",
      answer: "All kinds of technical projects as long as it’s open-source!"
    },
    {
      question: "How many projects can I build?",
      answer: "There’s no limit! Dance as much as you can!"
    },
    {
      question: "Is this legit?",
      answer: "Yup. We’re Hack Club, a nonprofit that’s been running programs like this for years.\nPast rounds: Arcade, High Seas, Summer of Making, and Flavortown. Teens build projects, we send out real prizes. Stardance is this summer’s round."
    }
  ].freeze

  def up
    FAQ_ENTRIES.each do |attrs|
      FaqEntry.find_or_create_by!(question: attrs[:question]) do |entry|
        entry.answer = attrs[:answer]
      end
    end
  end

  def down
  end
end
