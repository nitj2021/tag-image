require 'spec_helper'

describe Photo do
  context "validations" do
    it { should belong_to(:album) }

  end
end