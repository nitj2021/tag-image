class Photo < ActiveRecord::Base
  belongs_to :album
  serialize :x_cord, Array
  serialize :y_cord, Array
  serialize :tag, Array
  has_attached_file :picture,
      :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" },

                    :url => "/assets/album/:id/:style/:basename.:extension",
                    :path => ":rails_root/app/assets/images/album/:id/:style/:basename.:extension"
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  attr_accessible :album_id, :picture, :x_cord, :y_cord, :tag
end
