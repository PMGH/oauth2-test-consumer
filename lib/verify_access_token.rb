def verify_access_token
  token = cookies[:access_token]
  jwt = JWT.decode token, ENV['SECRET'], true, { algorithm: ENV['ALGORITHM'] } if token
  redirect_to "http://localhost:3001/auth/doorkeeper" if !jwt
end
