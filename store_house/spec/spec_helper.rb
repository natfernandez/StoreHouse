require File.expand_path("config/environment")
unless ENV['DB'] || ENV['db']
  Dir[File.expand_path("db/*.rb")].sort.each { |f| require f }
end

RSpec.configure do |config|

  # Other config settings for RSpec
  config.expose_current_running_example_as :example
  # config.raise_errors_for_deprecations!

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed

end

