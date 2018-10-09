# Load required libraries
require 'json'

# This class acts as the pseudo model/database for User information
class UserData
  attr_reader :user_data_hash

  def initialize(user_file)
    @user_file = user_file
    @user_data_hash = []
    load_user_file
  end

  private

  def load_user_file
    @user_data_hash = JSON.parse(@user_file)
  end
end
