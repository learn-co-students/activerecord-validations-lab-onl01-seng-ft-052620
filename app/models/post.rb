class Post < ActiveRecord::Base
  CLICKBAITS = ["Won't Believe", "Secret", "Top [number]", "Guess"]

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "Should be Fiction or Non-Fiction"}
  validate :is_clickbait

  private
    def is_clickbait
      includes_clickbait = CLICKBAITS.find {|clickbait| self.title && self.title.include?(clickbait)}
      if !includes_clickbait
        self.errors.add(:title, "Must include clickbait")
      end
    end 
end
