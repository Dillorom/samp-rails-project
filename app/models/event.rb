class Event < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  has_many :rsvps
  has_many :attending_users, through: :rsvps, :source => :user
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :location, presence: true
  validates :details, presence: true

  scope :todays_events,  -> {where('time between ? and ?', Time.zone.now.beginning_of_day, Time.zone.now.end_of_day) } 
  scope :past_events,  -> {where('time < ?',  DateTime.now)}
  scope :future_events,  -> {where('time >= ?', DateTime.now)}

  def prev
    events = event_ids_by_name
    event_index = events.find_index(id)
    prev_event = event_index - 1

    if prev_event > 0
      events[prev_event]
    else
      id
    end
  end

  def next
    events = event_ids_by_name
    event_index = events.find_index(id)
    next_event = event_index + 1

    if next_event < events.length
      events[next_event]
    else
      id
    end
  end

  private 
  
  def event_ids_by_name
    Event.order(name: :asc).pluck(:id)
  end

end
