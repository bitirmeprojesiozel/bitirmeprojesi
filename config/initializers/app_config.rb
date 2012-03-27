module AppConfig #TODO: AppConfig Gem
  # @param key [Environment altındaki anahtarlardan biri]
  def self.[](key)
    unless @config
      raw_config = File.join(Rails.root, 'config', 'app_config.yml')
      @config = YAML.load(File.open(raw_config))[Rails.env]
    end
    @config[key]
  end
end