require 'pseudo_models/user_data'

RSpec.describe UserData do
    context "When testing the UserData class" do

        describe "initialize" do
            it "should return an array of data" do
                user_file = File.read('lib/data/users.json')
                user_data = UserData.new(user_file)
                returned_data = user_data.user_data_hash

                expect(returned_data).to be_an_instance_of(Array)
            end
        end
    end
end
