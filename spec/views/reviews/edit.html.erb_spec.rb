require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :user_id => 1,
      :restaurant_id => 1,
      :comment => "MyString",
      :star_rating => 1
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path(@review), :method => "post" do
      assert_select "input#review_user_id", :name => "review[user_id]"
      assert_select "input#review_restaurant_id", :name => "review[restaurant_id]"
      assert_select "input#review_comment", :name => "review[comment]"
      assert_select "input#review_star_rating", :name => "review[star_rating]"
    end
  end
end
