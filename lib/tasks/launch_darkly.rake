namespace :launch_darkly do
  desc "Create LD environment"
  task create_environment: :environment do
    begin
      environment_body = LaunchDarklyApi::EnvironmentPost.new
      environment_body.name = LAUNCH_DARKLY_ENV_NAME
      environment_body.key = LAUNCH_DARKLY_ENV_NAME
      environment_body.color = Random.bytes(3).unpack1('H*')
      LaunchDarklyApi::EnvironmentsApi.new.post_environment(LAUNCH_DARKLY_PROJECT_NAME,environment_body)
    rescue LaunchDarklyApi::ApiError => error
      if error.code == 409
        puts "LD environment with name : #{LAUNCH_DARKLY_ENV_NAME} already exists for project : #{LAUNCH_DARKLY_PROJECT_NAME}"
      end
      if error.code != 409
        puts "something went wrong, \ncode : #{error.code} \n\nheaders: #{error.response_headers} \n\nbody: #{error.response_body}"
        exit 1
      end 
    end
  end
end
