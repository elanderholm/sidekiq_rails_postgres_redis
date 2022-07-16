class Ld
 
  class << self 
    def get_environment(project:, env:)

      url = URI("https://app.launchdarkly.com/api/v2/projects/#{project}/environments/#{env}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["LD-API-Version"] = 'beta'
      request["Authorization"] = 'api-ce00e0a5-8be8-495a-959e-e1a39639410a'

      response = http.request(request)

      RecursiveOpenStruct.new(JSON.load(response.body), recurse_over_arrays: true)
    end 
  end

end
