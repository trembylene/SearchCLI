require 'pseudo_models/ticket_data'

RSpec.describe TicketData do
    context "When testing the TicketData class" do

        describe "initialize" do
            it "should return an array of data" do
                ticket_file = File.read('lib/data/tickets.json')
                ticket_data = TicketData.new(ticket_file)
                returned_data = ticket_data.ticket_data_hash

                expect(returned_data).to be_an_instance_of(Array)
            end
        end
    end
end
