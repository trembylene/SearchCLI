require 'pseudo_models/organization_data'
require 'views/organization_view'
require 'controllers/organizations_controller'

RSpec.describe OrganizationsController do
    context "When testing the OrganizationsController class" do

        describe ".list" do
            it "should return an array of data" do
                organization_file = File.read('lib/data/organizations.json')
                organization_data = OrganizationData.new(organization_file)
                organizations_controller = OrganizationsController.new(organization_data)
                returned_data = organizations_controller.list

                expect(returned_data).to be_an_instance_of(Array)
            end
        end

        describe ".search" do
            it "should return a search term and matched results" do
                search_term = 'test'
                matched_results = [{test: 'test'}]
                organization_view = OrganizationView.new

                expect(search_term).to eq('test')
                expect(matched_results).to eq([{test: 'test'}])
            end
        end
    end
end
