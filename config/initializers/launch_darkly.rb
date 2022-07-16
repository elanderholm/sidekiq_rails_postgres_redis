##set ld_client to use the api key for the specific environment
if ENV['LAUNCHDARKLY_ENV_SPECIFIC_SDK_KEY'].present?
  Rails.configuration.ld_client = LaunchDarkly::LDClient.new(ENV['LAUNCHDARKLY_ENV_SPECIFIC_SDK_KEY'])
end
