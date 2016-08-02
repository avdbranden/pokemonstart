# New controller to redirect to a specific path on sign-up
# See https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-up-(registration)

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    pokemons_path
  end
end
