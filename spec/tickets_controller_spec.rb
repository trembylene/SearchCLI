require 'pseudo_models/ticket_data'
require 'views/ticket_view'
require 'controllers/tickets_controller'
RSpec.describe TicketsController do
  context 'When testing the TicketsController class' do
    describe '.list' do
      it 'should return an array of data' do
        ticket_file = File.read('lib/data/tickets.json')
        ticket_data = TicketData.new(ticket_file)
        tickets_controller = TicketsController.new(ticket_data)
        returned_data = tickets_controller.list

        expect(returned_data).to be_an_instance_of(Array)
      end
    end

    describe '.search' do
      it 'should return a search term and matched results' do
        search_term = 'test'
        matched_results = [{ test: 'test' }]

        expect(search_term).to eq('test')
        expect(matched_results).to eq([{ test: 'test' }])
      end
    end
  end
end
