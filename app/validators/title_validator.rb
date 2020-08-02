class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
            phrases = ["Won't Believe", "Secret", "Top[number]", "Guess"]
            if phrases.detect{|phrase| record.title.match?(phrase)}.nil?
                record.errors[:title] << "Not clickbaty enough"
            end 
        end 
    end 
end 

