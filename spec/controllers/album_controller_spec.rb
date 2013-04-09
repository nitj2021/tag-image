require 'spec_helper'

describe AlbumController, :type => :controller do
  #fixtures :user
  include Devise::TestHelpers
  render_views
  setup :login
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should get create" do
    assert_difference "Album.count", 1 do
      post :create, :name=>"nitin"
    end
  end

  it "should get delete" do

    assert_difference "Album.count", -1 do
      delete :destroy, :id=>1
    end
  end
  it "should get dup_album_name" do
    get :dup_album_name
    assert_response :success
  end
end