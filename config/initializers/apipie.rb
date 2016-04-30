Apipie.configure do |config|
  config.app_name                = "Question & Answer"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info = <<-EOS 
    Wszytskie strzaly zawierajace kontekts Usera (wymaga bycia zalogowanym) musza zawierac w headers pola:
      Content-Type:application/json
      Accept:application/json
      access-token: token
      client: clientID
      expiry: expTime
      token-type:Bearer
      uid: user_email

    Tak jak to jest w tej bibliotece do autentykacji.
    https://github.com/lynndylanhurley/devise_token_auth#authentication-headers-example
    Wtedy jednoznaczni identyfikuje usera ktory wykonuje call.
    Kazdy reposne w kontekstem Usera zwraca w headers nowe tokeny i expTime.
   EOS

end
