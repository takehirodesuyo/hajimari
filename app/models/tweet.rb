class Tweet < ApplicationRecord
    belongs_to :user


    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }


    def self.search(search)
        search ? where('id LIKE ?', "%#{search}%") : all
    end

   
end
