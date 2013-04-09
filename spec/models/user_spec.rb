
          require 'spec_helper'

describe User do
  context "validations" do

      it { should have_many(:albums) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end