# Load required libraries
require 'json'

# This class acts as the pseudo model/database for Organization information
class OrganizationData
  attr_reader :organization_data_hash

  def initialize(organization_file)
    @organization_file = organization_file
    @organization_data_hash = []
    load_organization_file
  end

  private

  def load_organization_file
    @organization_data_hash = JSON.parse(@organization_file)
  end
end
