class Proprietaire < ActiveRecord::Base
  has_many :campings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
acts_as_messageable
         def index

         end
end
