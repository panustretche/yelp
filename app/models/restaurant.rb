class Restaurant < ActiveRecord::Base
  attr_accessible :name

  has_many :reviews

  def no_of_review
    Review.where(:restaurant_id=>id).count
  end

  def average_rating
    @reviews = Review.where(:restaurant_id=>id).average(:star_rating).to_i
  end

end
