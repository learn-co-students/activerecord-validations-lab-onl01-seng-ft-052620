class TitleValidator < ActiveModel::Validator
    CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]
    
    def validate(record)
        unless record.title.nil?
            any = CLICKBAIT.any?{|phrase| record.title.include?(phrase)}

            unless any
                record.errors[:title] << "Not ClickBait"
            end
        else
            record.errors[:title] << "Title Can't be empty."
        end
    end
end
