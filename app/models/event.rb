class Event < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :location, presence: true
  validates :details, presence: true

  # scope :upcoming, -> { where(upcoming: true) }

  # def self.upcoming
  #   where(self.time > Time.now)
  # end

  def self.past
    
    self.all.map do |event|
      if event.time  < Time.now
        return event
      end
    end
  
  end

  
end
