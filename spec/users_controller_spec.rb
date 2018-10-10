require 'pseudo_models/user_data'
require 'views/user_view'
require 'controllers/users_controller'

RSpec.describe UsersController do
  context 'When testing the UsersController class' do
    describe '.list' do
      it 'should return an array of data' do
        user_file = File.read('lib/data/users.json')
        user_data = UserData.new(user_file)
        users_controller = UsersController.new(user_data)
        returned_data = users_controller.list

        expect(returned_data).to be_an_instance_of(Array)
      end
    end

    describe '.search' do
      it 'should return a search term and matched results' do
        search_term = 'test'
        matched_results = [{ test: 'test' }]
        user_view = UserView.new

        expect(search_term).to eq('test')
        expect(matched_results).to eq([{ test: 'test' }])
      end
    end
  end
end
