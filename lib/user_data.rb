# Load required libraries
require 'json'

# This is the class that acts as the pseudo model/data for the data
class UserData
    attr_reader :data_hash

    def initialize(user_file)
        @user_file = user_file
        @data_hash = []
        load_user_file
    end

    private

    def load_user_file
        @data_hash = JSON.parse(@user_file)
        # .with_indifferent_access
        
        # format to get results: @data_hash[0]["url"]
        # format to get results: @data_hash[0].url
    end
end