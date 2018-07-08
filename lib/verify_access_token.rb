def verify_access_token
  token = cookies[:access_token]
  jwt = JWT.decode token, "MY-SECRET", true, { algorithm: 'HS512' } if token
  redirect_to "http://localhost:3001/auth/doorkeeper" if !jwt
end
