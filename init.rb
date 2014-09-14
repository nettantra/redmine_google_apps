require 'redmine'

require_dependency 'google_apps/hooks'

Redmine::Plugin.register :redmine_google_apps do
  name 'Google Apps plugin'
  author 'Devadatta Sahoo'
  description 'Google Apps user integration'
  version '0.1'
  url 'https://github.com/nettantra/redmine_google_apps'
  author_url 'http://www.nettantra.com/'

  menu :admin_menu, :google_apps, { :controller => 'google_apps', :action => 'admin' }, :caption => 'Google Apps'

end
