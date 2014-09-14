#require 'gapps_openid'

class GoogleAppsController < AccountController

  layout 'admin'

  AX_EMAIL = 'http://axschema.org/contact/email'
  AX_FIRST = 'http://axschema.org/namePerson/first'
  AX_LAST = 'http://axschema.org/namePerson/last'

  def login
    domain = GoogleAppsAuthSource.find params[:ga_domain]
    oid = "https://www.google.com/accounts/o8/site-xrds?hd=#{domain.name}"
    attributes = [AX_EMAIL, AX_FIRST, AX_LAST]

    authenticate_with_open_id(oid, :return_to => request.url, :required => attributes) do |result, identity_url, profile_data|
      if result.successful?
        ax_response = OpenID::AX::FetchResponse.from_success_response(request.env[Rack::OpenID::RESPONSE])
        email = ax_response[AX_EMAIL].first
        first = ax_response[AX_FIRST].first
        last = ax_response[AX_LAST].first

        user = domain.users.find_by_mail email
        if user.nil?
          login = email[/^[^@]*/]

          begin
            user = User.new :firstname => first, :lastname => last, :mail => email
            user.login = login
            user.auth_source = domain
            user.save!
          rescue
            flash[:error] = 'There was an error creating your account. Please contact your administrator.'
            return redirect_to :controller => :account, :action => :login
          end
        end

        user.update_attribute(:last_login_on, Time.now)

        successful_authentication user
      else
        flash[:error] = result.message
        redirect_to :controller => :account, :action => :login
      end
    end
  end

  def admin
    @domains = GoogleAppsAuthSource.all
  end

  def add
    if request.post?
      GoogleAppsAuthSource.create! params[:ga_domain]
      redirect_to :action => :admin
    end
  end

  def delete
    GoogleAppsAuthSource.delete_all :name => params[:ga_domain]
    redirect_to :action => :admin
  end

end
