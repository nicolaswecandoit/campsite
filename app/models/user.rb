class User < ApplicationRecord
    has_many :campings
    has_many :comments  
    
    #test
    has_many :messages
    has_many :conversations
    has_many :notifications, foreign_key: :recipient_id
    
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
          
    has_attached_file :avatar, styles: { small: "30x30#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
 
end
