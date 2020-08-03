class PostValidator < ActiveModel::Validator

    def validate(record)
        if record.title
            unless record.title.match?(/Won't Believe/) || record.title.match?(/Secret/) || record.title.match?(/Guess/) || record.title.match?(/Top (\d+)/)
                record.errors[:name] << 'Title is not clickbait-y'
            end
        else
            record.errors[:name] << 'Title is missing'
        end
    end
    
end
