require 'rails/engine'

module Datajam
  module Myplugin
    class Engine < Rails::Engine
      if Rails.env =~ /^(development|test)$/
        initializer "datajam.myplugin.static_assets" do |app|
          app.middleware.use ::ActionDispatch::Static, "#{root}/public"
        end
      end
    end
  end
end
