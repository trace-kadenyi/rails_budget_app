class RegistrationsController < Devise::RegistrationsController

def create
  build_resource(sign_up_params)

if resource.save
  if resource.active_for_authentication?
    set_flash_message :notice, :signed_up if is_navigational_format?
    sign_up(resource_name, resource)
    respond_with resource, :location => after_sign_up_path_for(resource)
  else
    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
    respond_with resource, :location => after_sign_up_path_for(resource)
  end
else
  clean_up_passwords
  respond_with resource
end
end  
# you will get the full registration controller in devise github repo

 private

def sign_up_params
 params.require(:user).permit(:email, :name, :password, :password_confirmation)
end

end