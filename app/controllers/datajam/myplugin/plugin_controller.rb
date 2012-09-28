module Datajam
  module Myplugin
    class PluginController < ::ApplicationController
      before_filter :authenticate_user!

      def install
        begin
          Datajam::Myplugin::InstallJob.perform
          flash[:notice] = "Plugin installed."
          redirect_to admin_plugin_path('myplugin')
        rescue
          flash[:error] = "Failed to install plugin: #{$!}"
          redirect_to admin_plugins_path
        end
      end

      def uninstall
        begin
          Datajam::Myplugin::UninstallJob.perform
          flash[:notice] = "Plugin uninstalled."
          redirect_to admin_plugins_path
        rescue
          flash[:error] = "Failed to uninstall plugin: #{$!}"
          redirect_to admin_plugin_path('myplugin')
        end
      end
    end
  end
end
