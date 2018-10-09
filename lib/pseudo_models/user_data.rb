# Load required libraries
require 'json'

# This class acts as the pseudo model/database for User
# information, by parsing json into ruby hash upon app
# load, and by making this data available to the controller
class UserData
  attr_reader :user_data_hash

  def initialize(user_file)
    # loads necessary data for the UserData class
    @user_file = user_file
    @user_data_hash = []
    load_user_file
  end

  private

  def load_user_file
    # parses json
    @user_data_hash = JSON.parse(@user_file)
  end
end
