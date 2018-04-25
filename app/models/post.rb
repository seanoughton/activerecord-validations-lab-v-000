class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :is_clickbait?

   

   def is_clickbait?
     if title
       if !title.include?("Won't" && "Believe") && !title.include?("Secret" || "Guess") && !title.include?("Won't" && "Believe") && !title.include?("/Top [0-9]*/")
         errors.add(:title, "must be clickbait")
       end
     end

   end

end
