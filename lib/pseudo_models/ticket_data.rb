# Load required libraries
require 'json'

# This class acts as the pseudo model/database for Ticket information
class TicketData
  attr_reader :ticket_data_hash

  def initialize(ticket_file)
    @ticket_file = ticket_file
    @ticket_data_hash = []
    load_ticket_file
  end

  private

  def load_ticket_file
    @ticket_data_hash = JSON.parse(@ticket_file)
  end
end
