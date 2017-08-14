class Post < ActiveRecord::Base
	validates :title, presence: true
	validates_uniqueness_of :title
	validates :content, length: { minimum: 250 }
  	validates :summary, length: { maximum: 250 }
  	validates :category, inclusion: {:in => ["Fiction","Non-Fiction"]}
  	validate :clickbait



def clickbait
   if title != nil && !title.start_with?('Won\'t Believe', 'Secret', 'Top', 'Guess', "You Won\'t")
   	errors.add(:title, "Not clickbait title")
   end
end


end

