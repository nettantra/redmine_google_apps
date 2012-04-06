ActionController::Routing::Routes.draw do |map|
  map.connect 'admin/plugins/google_apps/:action', :controller => 'google_apps', :conditions => {:method => [:post, :get]}
end
