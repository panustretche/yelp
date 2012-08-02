require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :user_id => 1,
        :restaurant_id => 2,
        :comment => "Comment",
        :star_rating => 3
      ),
      stub_model(Review,
        :user_id => 1,
        :restaurant_id => 2,
        :comment => "Comment",
        :star_rating => 3
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
