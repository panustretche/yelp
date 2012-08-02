require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :name => 'John',
      :email => 'john@gmail.com'
    }
  end
  it 'should create a new instance given a valid attribute' do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

end
