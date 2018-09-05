module ApplicationHelper
    def display_time(event)
        event.time.strftime('%A, %d %b %Y %l:%M %p')
      end
end
