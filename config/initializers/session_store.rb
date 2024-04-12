if Rails.env.production?
  Rails.application.config.session_store :cookie_store, :key => 'can_lily_eat_it', domain: :all, tld_length: 2
else
  Rails.application.config.session_store :cookie_store, key: 'can_lily_eat_it'
end