class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  validates :name, :presence=>true, :uniqueness => true
  attr_accessible :name, :user_id

def self.get_name(id)
self.find(id).name
end
end
