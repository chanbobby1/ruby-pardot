module Pardot
  module Objects
    module Prospects

      def prospects
        @prospects ||= Prospects.new self
      end

      class Prospects

        def initialize client
          @client = client
        end

        def query search_criteria
          result = get "/do/query", search_criteria, "result"
          result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end

        def assign_by_email email, params
          post "/do/assign/email/#{CGI::escape(email)}", params
        end

        def assign_by_id id, params
          post "/do/assign/id/#{CGI::escape(id.to_s)}", params
        end

        def create email, params = {}
          post "/do/create/email/#{CGI::escape(email)}", params
        end

        def read_by_email email, params = {}
          post "/do/read/email/#{CGI::escape(email)}", params
        end

        def read_by_id id, params = {}
          post "/do/read/id/#{CGI::escape(id.to_s)}", params
        end

        def update_by_email email, params = {}
          post "/do/update/email/#{CGI::escape(email)}", params
        end

        def update_by_id id, params = {}
          post "/do/update/id/#{CGI::escape(id.to_s)}", params
        end

        def upsert_by_email email, params = {}
          post "/do/upsert/email/#{CGI::escape(email)}", params
        end

        def upsert_by_id id, params = {}
          post "/do/upsert/id/#{CGI::escape(id.to_s)}", params
        end

        def delete_by_email email
          post "/do/delete/email/#{CGI::escape(email)}"
        end

        def delete_by_id id
          post "/do/delete/id/#{CGI::escape(id.to_s)}"
        end

        protected

        def get path, params = {}, result = "prospect"
          response = @client.get "prospect", path, params
          result ? response[result] : response
        end

        def post path, params = {}, result = "prospect"
          response = @client.post "prospect", path, params
          result ? response[result] : response
        end

      end

    end
  end
end
