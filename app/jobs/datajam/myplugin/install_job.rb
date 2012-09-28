module Datajam
  module Myplugin
    module InstallJob
      def self.perform
        # install settings
        Datajam::Myplugin::Engine.load_seed
      end
    end
  end
end
