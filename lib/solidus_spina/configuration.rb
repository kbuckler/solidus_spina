# frozen_string_literal: true

module SolidusSpina
  class Configuration
    attr_accessor :spina_resource_name, :spina_view_template_name
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    alias config configuration

    def configure
      yield configuration
    end
  end
end
