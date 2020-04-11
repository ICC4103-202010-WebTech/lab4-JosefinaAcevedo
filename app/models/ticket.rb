class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the following
  before_create :update_stats
  before_destroy :update_stats1

  private
    def update_stats
      es = self.ticket_type.event.event_stat
      er = self.ticket_type.event.event_venue
      # TODO: complete in order to update event stats
      if es.tickets_sold +1 > er.capacity
        raise "All the tickets are sold!"
      else
        es.tickets_sold = es.tickets_sold +1
        es.attendance = es.attendance +1
      end
    end

    def update_stats1
      ed = self.ticket_type.event.event_stat
      ed.tickets_sold = ed.tickets_sold -1
      ed.attendance = ed.attendance -1
    end

end
