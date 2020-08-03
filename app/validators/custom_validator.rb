class CustomValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match?( "Won't Believe", "Secret", "Top [number]", "Guess")
            record.errors[:title] << "You don't have a valid title yet"
        end
    end
end