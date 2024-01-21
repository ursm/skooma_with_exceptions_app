require 'rails_helper'

RSpec.describe 'posts', type: :request do
  example do
    get '/'

    # pass
    expect(response).to have_http_status(418)

    # pass
    expect(response.parsed_body).to eq('message' => "I'm a teapot")

    # error
    expect(response).to conform_schema(418)
    #
    # Failures:
    #
    #   1) posts is expected to conform schema with 418 response code
    #      Failure/Error: expect(response).to conform_schema(418)
    #
    #        ENV:
    #        {"method"=>"get",
    #         "path"=>"/501",
    #         "request"=>
    #          {"query"=>"",
    #           "headers"=>
    #            {"Content-Length"=>"0",
    #             "Host"=>"www.example.com",
    #             "Accept"=>
    #              "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5",
    #             "Cookie"=>""},
    #           "body"=>nil},
    #         "response"=>
    #          {"status"=>418,
    #           "headers"=>
    #            {"content-type"=>"application/json",
    #             "x-request-id"=>"90a2f755-247d-4ce2-92fc-36ee2c2471ff",
    #             "x-runtime"=>"0.051812",
    #             "content-length"=>"26"},
    #           "body"=>"{\"message\":\"I'm a teapot\"}"}}
    #
    #
    #        Validation Result:
    #        {"instanceLocation"=>"",
    #         "relativeKeywordLocation"=>"",
    #         "keywordLocation"=>"",
    #         "errors"=>
    #          [{"instanceLocation"=>"",
    #            "relativeKeywordLocation"=>"/paths",
    #            "keywordLocation"=>"/paths",
    #            "error"=>"Path /501 not found in schema"}]}
    #      # ./spec/requests/posts_spec.rb:10:in `block (2 levels) in <top (required)>'
    #
  end
end
