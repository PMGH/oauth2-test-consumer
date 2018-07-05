require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :doorkeeper, <application_id>, <application_secret>
  provider :doorkeeper, 'd27d4d535e7e90f9718bd726de4f7d2a23d2f9733512eb742b33d3cc8c110848', '74d9d2b284c91d6b9838085764819c520d3aaaa93ce3b202236c09ee123a5393'
end
