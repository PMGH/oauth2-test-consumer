# README

* Ruby version
2.5.1

* oauth2 version
1.4.0

* omniauth version
1.8.1

* omniauth-oauth2 version
1.5.0

## About
This is a dummy OAuth application (Consumer).

## Getting up and running

This application is the OAuth Consumer/Client application (on port 3001) and should be run alongside the Provider/Server application (on port 3000).

The reason they are to be run on specific ports is due to the omniauth configuration on the Consumer application in doorkeeper.rb:
```rubyonrails
option :client_options, {
  site:          'http://localhost:3000',
  authorize_url: 'http://localhost:3000/oauth/authorize'
}
```


## OAuth Consumer

The OAuth Consumer application is the application which the user is seeking access to.

```
git clone git@github.com:PMGH/oauth2-test-consumer.git
```

- cd into repo and run: `PORT=3001 rails server`


## OAuth Provider

The Provider application authenticates the user using the devise gem. It also carries out the authorization of Consumer applications by providing the user with an authorization_code that is then exchanged for an access_token (a JWT).

Once running, Consumer applications can be added on the http://localhost:3000/oauth/applications page.

```
git clone git@github.com:PMGH/oauth2-test-provider.git
```

- cd into repo and run: `PORT=3000 rails server`



## WIP
- When trying to access the Consumer application (localhost:3001) for the first time the user should be redirected to the sign in page of the Provider application (localhost:3000/users/sign_in)
- Once signed in they should be presented with the Authorization request (localhost:3000/oauth/authorize?). The url should contain the following query params:

- client_id - the Consumer application id found on the http://localhost:3000/oauth/applications/:id page
- redirect_uri - the Consumer application callback uri found on the http://localhost:3000/oauth/applications/:id page e.g. http://localhost:3001/auth/doorkeeper/callback
- response_code=code  - expects an authorization code to be returned

For example:

`http://localhost:3000/oauth/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code`


## Resources
**OAuth 2**
- OAuth2 Overview:  https://www.youtube.com/watch?v=CPbvxxslDTU

**Devise**
- Devise:  https://github.com/plataformatec/devise

**Doorkeeper**
- Doorkeeper Authorization Flow:  https://github.com/doorkeeper-gem/doorkeeper/wiki/Authorization-Code-Flow

**JWTs**
- Doorkeeper-JWT:  https://github.com/chriswarren/doorkeeper-jwt
- JWTs:  https://jwt.io/
