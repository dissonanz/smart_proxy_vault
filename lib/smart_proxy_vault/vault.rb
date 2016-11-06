require_relative './version'

module VaultPlugin
  class Plugin < ::Proxy::Plugin
    plugin 'vault', VaultPlugin::VERSION

    settings_file 'vault.yml'
    default_settings auth_backend: 'chef',
                     vault: {},
                     add_token_metadata: false,
                     token_options: {},
                     chef: {}

    http_rackup_path File.expand_path('http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('https_config.ru', File.expand_path('../', __FILE__))
  end
end
