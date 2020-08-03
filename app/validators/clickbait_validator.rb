class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
        clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
        if record.title
            unless clickbait.any?{|a| record.title.match?(a)}
                record.errors[:title] << 'This title is not clickbait'
            end
        end
    end
end

#Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. 
# If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.