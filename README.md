Google Apps login for Redmine
=============================

This Redmine plugin allows you to login using your Google Apps domain's user.


Requirements
------------

* Redmine 1.2.x or newer
* The gems 'ruby-openid' and 'ruby-openid-apps-discovery' installed
* ... a Google Apps domain ;-)

Install
-------

Clone the plugin source code into your Redmine's plugin directory.

* Redmine 1.x

    git clone git://github.com/waj/redmine_google_apps.git vendor/plugins/redmine_google_apps

* Redmine 2.x

    git clone git://github.com/waj/redmine_google_apps.git plugins/redmine_google_apps
    bundle install --without development test


Install the required gems:

    gem install ruby-openid ruby-openid-apps-discovery


Setup
-----

Login with your administrator account, go to the Administration section and now you should see the 'Google Apps' link. Add your Google Apps domain like 'example.com'. (Note, it's not www.example.com).

Logout and go to the login page again. Now a link to login with your Google Apps domain should be visible.
