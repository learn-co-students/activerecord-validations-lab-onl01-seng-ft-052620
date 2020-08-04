class Post < ActiveRecord::Base
  CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  validates_presence_of :title
  validates_length_of :content, {minimum: 250}
  validates_length_of :summary, {maximum: 250}
  validates_inclusion_of :category, {in: %w(Fiction Non-Fiction), message: "Not a valid category"}
  validate :clickbait

  private
    def clickbait
      if !CLICKBAIT.any?{|c| self.title && self.title.include?(c)}
        errors[:title] << "Not clickbaity enough"
      end
    end
end
