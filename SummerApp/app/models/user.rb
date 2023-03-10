class User < ApplicationRecord
  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow', dependent: :destroy

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy

  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed_user

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0 }
end
