class Event < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :location, presence: true
  validates :details, presence: true

end
