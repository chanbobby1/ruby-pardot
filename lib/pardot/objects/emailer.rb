module Pardot
  module Objects
    module Emailer

      def emailer
        @emailer ||= Emailer.new self
      end

      class Emailer

        def initialize client
          @client = client
        end

        def send_by_id id, params = {}
          post "/do/send/prospect_id/#{CGI::escape(id.to_s)}", params
        end

        def send_by_email email, params = {}
          post "/do/send/prospect_email/#{CGI::escape(email)}", params
        end

        def send_by_list_ids campaign_id, list_ids, params
          post "do/send/", params.merge({
            :campaign_id => campaign_id,
            :list_ids => list_ids
          })
        end

        protected

        def get path, params = {}, result = "email"
          response = @client.get "email", path, params
          result ? response[result] : response
        end

        def post path, params = {}, result = "email"
          response = @client.post "email", path, params
          result ? response[result] : response
        end

      end

    end
  end
end
