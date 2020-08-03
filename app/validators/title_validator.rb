require 'pry'

class TitleValidator < ActiveModel::Validator

  def validate(record)
    if record.title
      unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
      record.errors[:title] << "Please make this more clickbait-y."
      end
    end
  end
end
