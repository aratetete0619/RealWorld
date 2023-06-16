Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to a reasonable value in production.
  # This example sets it to 10%, but you should adjust based on your app's needs.
  config.traces_sample_rate = 0.1

  # If you prefer to use traces_sampler, you can use a lambda to determine
  # when to capture transactions.
  # config.traces_sampler = lambda do |context|
  #   true
  # end
end
