class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: { minimum: 30}

    def total_likes
        self.posts.map.sum do |post_instance|
            post_instance.likes
        end
    end

   
end
