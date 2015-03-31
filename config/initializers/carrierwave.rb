CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :AWS_ACCESS_KEY_ID => ENV["AWS_ACCESS_KEY_ID"],
    :AWS_SECRET_ACCESS_KEY => ENV["AWS_SECRET_ACCESS_KEY"],
    :region  => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']  # required
  config.fog_public  = true  # optional, defaults to true
end