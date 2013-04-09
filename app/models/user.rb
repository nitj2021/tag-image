class User < ActiveRecord::Base
  has_many :albums, :dependent => :destroy
  accepts_nested_attributes_for :albums, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
