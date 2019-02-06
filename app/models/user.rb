class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

=begin
  :confirmable 
    They send an email to confirm you signed up.
  :lockable
    Lock a user out after a certain amount of login attempts
  :timeoutable
    Log user out after a certain amount of time 
  :omniauthable
    Implement 3rd party log in's. EX: Login in using facebook or google
=end