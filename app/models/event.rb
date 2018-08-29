class Event < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :location, presence: true
  validates :details, presence: true

  scope :todays_events,  -> {where('time between ? and ?', Time.zone.now.beginning_of_day, Time.zone.now.end_of_day) } 
  scope :past_events,  -> {where('time < ?',  DateTime.now)}
  scope :future_events,  -> {where('time >= ?', DateTime.now)}

end
