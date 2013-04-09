class AddTagCordinateToPhotos < ActiveRecord::Migration
  def change
    add_column :photos,:x_cord,:text
    add_column :photos,:y_cord,:text
    add_column :photos,:tag,:text
  end

end
