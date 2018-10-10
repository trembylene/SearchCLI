require 'pseudo_models/organization_data'

RSpec.describe OrganizationData do
    context "When testing the OrganizationData class" do

        describe "initialize" do
            it "should return an array of data" do
                organization_file = File.read('lib/data/organizations.json')
                organization_data = OrganizationData.new(organization_file)
                returned_data = organization_data.organization_data_hash

                expect(returned_data).to be_an_instance_of(Array)
            end
        end
    end
end
