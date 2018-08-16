OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    provider :google_oauth2, "667045447432-e5g1nik2a961k0uhletb4oq30t6t3oc1.apps.googleusercontent.com", "Hr4PRd2tSGPy_A_orrrdXSNU"
    
  end
  

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, 'my Google client id', 'my Google client secret', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
# end