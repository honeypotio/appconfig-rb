require 'ostruct'
require 'yaml'
require 'erb'
require 'active_support/core_ext'

class Object
  def to_os
    self
  end
end

class Array
  def to_os
    map { |el| el.to_os }
  end
end

class Hash
  def to_os
    mapped = {}
    each { |key, value| mapped[key] = value.to_os }
    OpenStruct.new(mapped)
  end
end

class ApplicationConfig
  class << self
    def config
      pub_config = load_config('config/config.yml')
      sec_config = load_config('config/secrets.yml')

      pub_config.deep_merge(sec_config).to_os
    end

    private

    def load_config(file_name)
      file = File.read(File.expand_path(file_name, root))
      rendered = ERB.new(file).result
      yml = YAML.load(rendered)

      yml[env] || {}
    rescue Psych::SyntaxError => e
      puts "ERROR PARSING YAML FILE #{file_name.inspect}: #{e.to_s}"
      {}
    rescue
      {}
    end

    def root
      defined?(Rails) ? Rails.root.to_s : __FILE__
    end

    def env
      defined?(Rails) ? Rails.env : 'development'
    end
  end
end

::AppConfig = ApplicationConfig.config
