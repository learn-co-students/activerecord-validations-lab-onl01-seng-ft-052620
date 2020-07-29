class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    acceptable_patterns = [/.*Won't Believe.*/, /.*Secret.*/, /.*Top \d.*/, /.*Guess.*/]
    if record.title
      unless acceptable_patterns.any?{|pattern| record.title.match?(pattern)}
        record.errors[:title] << "Title is not clickbaity enough!"
      end
    end
  end
end