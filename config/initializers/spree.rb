# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
end

Spree.user_class = "Spree::LegacyUser"

attachment_config = {

    s3_credentials: {
        access_key_id:     ENV['AKIAI3QAYNK2AUJDQS2Q'],
        secret_access_key: ENV['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'],
        bucket:            ENV['elasticbeanstalk-us-west-2-797738718062']
    },

    storage:        :s3,
    s3_headers:     { "Cache-Control" => "max-age=31557600" },
    s3_protocol:    "https",
    bucket:         ENV['elasticbeanstalk-us-west-2-797738718062'],
    url:            ":s3-us-west-2.amazonaws.com",

    styles: {
        mini:     "48x48>",
        small:    "100x100>",
        product:  "240x240>",
        large:    "600x600>"
    },

    path:           "/:class/:id/:style/:basename.:extension",
    default_url:    "/:class/:id/:style/:basename.:extension",
    default_style:  "product"
}

attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end
