class ClickbaitValidator < ActiveModel::Validator

    def validate(record)
        clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
           if record.title
        unless clickbait.any?{|array| record.title.match?(array)} 
          record.errors[:title] << 'Title is not clickbait'
          end
        end
      end

end