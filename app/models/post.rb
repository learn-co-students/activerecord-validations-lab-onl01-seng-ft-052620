class Post < ActiveRecord::Base
    validate :title_is_clickbaity

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction','Non-Fiction']}

    private 

    def title_is_clickbaity
        unless [/Won't Believe/i,/Secret/i,/Guess/i,/Top [0-9]+/i].any? {|i| self.title=~ i }
            errors.add(:title, "not clickbait-y")
        end
    end

end
