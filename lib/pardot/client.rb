module Pardot

  class Client

    include HTTParty
    base_uri 'https://pi.pardot.com'

    include Authentication
    include Http

    include Objects::Accounts
    include Objects::Lists
    include Objects::Opportunities
    include Objects::Prospects
    include Objects::Users
    include Objects::Visitors
    include Objects::Visits
    include Objects::VisitorActivities
    include Objects::Emailer

    attr_accessor :email, :password, :user_key, :api_key, :format

    def initialize email, password, user_key
      @email = email
      @password = password
      @user_key = user_key

      @format = "simple"
    end


  end
end
