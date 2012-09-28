Rails.application.routes.draw do
  scope module: 'datajam/myplugin' do

    # plugin routes go here...

    scope '/admin/plugins/myplugin' do
      get '/install' => 'plugin#install'
      get '/uninstall' => 'plugin#uninstall'
    end
  end

  namespace :admin do
    # resourceful admin routes go here...
  end
end
