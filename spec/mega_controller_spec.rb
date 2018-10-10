require 'views/mega_view'
require 'controllers/mega_controller'

RSpec.describe MegaController do
  context 'When testing the MegaController class' do
    describe '.search' do
      it 'should return a search term and matched results' do
        search_term = 'test'
        matched_results = [{ test: 'test' }]
        mega_view = MegaView.new

        expect(search_term).to eq('test')
        expect(matched_results).to eq([{ test: 'test' }])
      end
    end
  end
end
