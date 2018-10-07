# Load required libraries
require 'json'

# This is the class that acts as the pseudo model/data for the data
class JsonData
    attr_reader :data_hash

    def initialize(json_file)
        @json_file = json_file
        @data_hash = []
        load_json_file
    end

    private

    def load_json_file
        @data_hash = JSON.parse(@json_file)
        # .with_indifferent_access
        
        # format to get results: @data_hash[0]["url"]
        # format to get results: @data_hash[0].url
    end
end