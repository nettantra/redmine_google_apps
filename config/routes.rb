if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match 'admin/plugins/google_apps/:action', :to => 'google_apps', :via => [:get, :post]
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect 'admin/plugins/google_apps/:action', :controller => 'google_apps', :conditions => {:method => [:post, :get]}
  end
end