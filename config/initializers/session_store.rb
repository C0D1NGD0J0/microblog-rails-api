if Rails.env == "production"
	Rails.application.config.session_store :cookie_store, key: "_microblog_app", domain: "domain-placeholder.heroku-app.com"
else
	Rails.application.config.session_store :cookie_store, key: "_microblog_app"
end