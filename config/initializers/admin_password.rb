if ENV['PASSWORD'].present?
  ADMIN_PASSWORD = ENV['PASSWORD']
elsif Rails.env.development? || Rails.env.test?
  ADMIN_PASSWORD = 'password'
else
  raise('Por favor especificá una contraseña de administración para Psychlopedia en la variable de entorno PASSWORD')
end
