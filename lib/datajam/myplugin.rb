require "active_support/dependencies"
require "datajam/myplugin/version"
require "datajam/myplugin/engine"

module Datajam
  module Myplugin
    def self.setup
      yield self if block_given?
    end
    def self.install_required?
      false
    end
    def self.installed?
      Datajam::Settings[:myplugin].any?
    end
  end
end
