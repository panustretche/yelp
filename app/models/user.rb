class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :reviews

  #scope :no_of_review, lambda{ |id| where(:user_id=>id).count }

  def no_of_review
    Review.where(:user_id=>id).count
  end

  def average_rating
    @reviews = Review.where(:user_id=>id).average(:star_rating).to_i
  end
end
