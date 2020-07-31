class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait
    
    def clickbait
        unless [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/].any? {|name| name.match title} 
            errors.add(:title, "Title is not clickbait-y enough!")
        end
    end
end
