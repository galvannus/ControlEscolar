class User < ApplicationRecord
  
  enum role: [:admin, :professor, :control]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :studentsubjects

  #class << self
    #def current_user=(user)
      #Thread.current[:current_user] = user
    #end

    #def current_user
      #Thread.current[:current_user]
    #end
  #end
end
