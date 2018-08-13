class Event < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :location, presence: true
  validates :details, presence: true

end
