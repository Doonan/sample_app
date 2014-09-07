# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # USe the existing token
    File.read(token_file).chomp
  else
  	# Generate a new token and store it in token_file
  	token = SecureRandom.hex(64)
  	File.write(token_file, token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
# SampleApp::Application.config.secret_key_base = '12ce45705cb5857a961dd881b4419a1d52425f070b33e9b2a7351acdce1f913259b52f0d5989b6175fda0b3e1784c5aa42e05612ad5068a42d19424097319c12'
