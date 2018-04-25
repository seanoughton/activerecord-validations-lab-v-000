class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :is_clickbait?

   CLICKBAIT_PATTERNS = [
     /Won't Believe/i,
     /Secret/i,
     /Top [0-9]*/i,
     /Guess/i
   ]

   def is_clickbait?
     #binding.pry
     #if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
     if title
       if !title.include?("Won't" && "Believe") && !title.include?("Secret" || "Guess") #|| !title.include?("Won't" && "Believe") || !title.include?("/Top [0-9]*/")
         errors.add(:title, "must be clickbait")
       end
     end

   end

end
