# frozen_string_literal: true

# Adding the Portus user.

if User.any?
  Rails.logger.fatal "The DB is not empty! Only seed for kick-starting your DB"
  exit(-1)
end

Rails.logger.info "Adding the \"portus\" user"
User.create!(
  username: "portus",
  password: Rails.application.secrets.portus_password,
  email:    "portus@portus.com",
  admin:    true
)
