module Pardot
  module Objects

    module Opportunities

      def opportunities
        @opportunities ||= Opportunities.new self
      end

      class Opportunities

        def initialize client
          @client = client
        end

        def query params
          result = get "/do/query", params, "result"
          result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end

        def create_by_email email, params = {}
          post "/do/create/prospect_email/#{CGI::escape(email)}", params
        end

        def create_by_id prospect_id, params = {}
          post "/do/create/prospect_id/#{CGI::escape(prospect_id)}", params
        end

        def read_by_id id, params = {}
          post "/do/read/id/#{CGI::escape(id.to_s)}", params
        end

        def update_by_id id, params = {}
          post "/do/update/id/#{CGI::escape(id.to_s)}", params
        end

        protected

        def get path, params = {}, result = "opportunity"
          response = @client.get "opportunity", path, params
          result ? response[result] : response
        end

        def post path, params = {}, result = "opportunity"
          response = @client.post "opportunity", path, params
          result ? response[result] : response
        end

      end

    end
  end
end
