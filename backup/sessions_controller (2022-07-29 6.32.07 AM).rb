class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # This is an example of how to extend the devise sessions controller
  # to support JSON based authentication and issuing a JWT.

  # Be sure to enable JSON.
  respond_to :html, :json
  
  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  def create
    # try to use both db and ldap. 2022-07-28...
    puts "entering sessions controller."
    @q2 = params[:user][:log]
    puts @q2

    if (params[:user][:log]=="local")   
      # email1 = resource.email
      puts 'log=local '
      puts       
      self.resource = warden.authenticate!(:database_authenticatable)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      self.resource = warden.authenticate!(:ldap_authenticatable)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end

  end

  
  # POST /resource/sign_in
  def create00
    # pre 2022-07-28. 

    # This is the default behavior from devise - view the sessions controller source:
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L16
 
    # from: https://github.com/jimjeffers/rails-devise-cors-jwt-example

    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?

    # Here we're deviating from the standard behavior by issuing our JWT
    # to any JS based client.
    token = JWTWrapper.encode({ user_id: current_user.id })    
    #token = AuthToken.issue_token({ user_id: resource.id })

    email1 = resource.email
    print 'email... '
    puts email1
    puts token
    puts
    respond_to do |format|
      format.html { respond_with resource, location: after_sign_in_path_for(resource) }
      format.json { render json: {user: email1, token: token} }
    end

    # The default behavior would have been to simply fire respond_with:
    # respond_with resource, location: after_sign_in_path_for(resource)
  end
  
  
  # generated by rails  g devise:controllers devise
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

