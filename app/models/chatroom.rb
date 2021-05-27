class Chatroom < ApplicationRecord
    has_many :messages
    has_many :matches

    def other_user(user)
      matches.first.from_user == user ? matches.first.to_user : matches.first.from_user
    end
end
