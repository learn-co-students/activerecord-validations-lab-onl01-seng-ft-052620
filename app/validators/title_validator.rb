class TitleValidator < ActiveModel::Validator
   
  
  def validate(record)
    clickbait_patterns = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ] 
    
    if clickbait_patterns.none? { |pat| pat.match record.title }
      record.errors[:title] << "Need more click bait"
    end
  end
end