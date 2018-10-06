# Load required libraries
require 'json'

# This is the class that acts as the model/controller for the data
class JsonData
    def initialize(json_file)
        @json_file = json_file
        load_json_file
    end

    private

    def load_json_file
        @data_hash = JSON.parse(@json_file)
    end
end