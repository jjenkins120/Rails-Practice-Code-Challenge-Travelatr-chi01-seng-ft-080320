class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def blogger_ave_age
        blogger_ages = self.bloggers.uniq.map do |blogger_instance|
            blogger_instance.age
        end
        blogger_ages.sum/blogger_ages.count
    end

end
