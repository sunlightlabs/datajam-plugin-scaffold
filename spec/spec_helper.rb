ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec'
require 'database_cleaner'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.include Mongoid::Matchers

  config.before(:suite) do
    Rails.backtrace_cleaner.remove_silencers!
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:all) do
    @redis_db = REDIS
    @redis = Redis::Namespace.new(Rails.env.to_s, :redis => @redis_db)
  end

  config.before(:each) do
    DatabaseCleaner.start

    # create settings
    Datajam::Myplugin::Engine.load_seed

    # Create a site template if one doesn't exist.
    unless SiteTemplate.first
      template_text = <<-EOT.strip_heredoc
      <html>
        <head>
          <title>Your Datajam Site</title>
          {{{ head_assets }}}
        </head>

        <body>
          <h1>Site Header</h1>
          {{{ content }}}
          {{{ body_assets }}}
        </body>

      </html>
      EOT
      SiteTemplate.create!(:name => 'Site', :template => template_text)
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
    @redis_db.keys("#{Rails.env.to_s}*").each {|key| @redis_db.del(key)}
  end
end
