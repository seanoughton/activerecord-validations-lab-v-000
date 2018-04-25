class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :is_clickbait?

  def is_clickbait?
    #if title != "Won't Believe"
      errors.add(:title, "must be clickbait")
    #end
    true
  end
end
