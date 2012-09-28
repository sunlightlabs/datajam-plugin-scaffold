# 'installed' setting is a placeholder to ensure that all plugins will have at least one setting
Setting.find_or_create_by(:namespace => 'myplugin', :name => 'installed', :value => true)