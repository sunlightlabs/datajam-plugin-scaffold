module Datajam
  module Myplugin
    module UninstallJob
      def self.perform
        # Remove settings
        Setting.where(:namespace => 'myplugin').destroy_all
        Datajam::Settings.flush('myplugin')
      end
    end
  end
end
