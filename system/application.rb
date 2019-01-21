require 'dry/system/container'
require 'dry/system/components'

module CFP
  class Application < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch('APP_ENV', 'development').to_sym }

    configure do |config|
      config.inflector = Dry::Inflector.new { |i| i.acronym('CFP') }
      config.auto_register = %w(lib web)
    end

    load_paths! 'lib', 'web'
  end

  Import = Application.injector
  ArgsImport = Import.args
end
