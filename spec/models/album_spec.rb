require 'spec_helper'

describe Album do
  context "validations" do
    it { should belong_to(:user) }
    it { should have_many(:photos) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it "get get_name" do
      assert Album.get_name('1'), 'find name of the album'
    end
  end
end