class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :camping
  
  
     def self.unread
  where(:read => false)
end


end
