class Review < ActiveRecord::Base
  attr_accessible :comment, :restaurant_id, :star_rating, :user_id

  belongs_to :resutaurant
  belongs_to :user

  before_create :one_review_per_one_user

  def reviewer
    User.find(user_id)
  end

  def restaurant
    Restaurant.find(restaurant_id)
  end

  def one_review_per_one_user
    @restaurant = Restaurant.find(self.restaurant_id)
    @user = User.find(self.user_id)
    @user.reviews.where(:restaurant_id=>@restaurant.id).first.blank? ? @already_reviewd = false : @already_reviewd = true
    raise "already reviewed" if @already_reviewd
  end
  

  
end
