require 'active_model'
require 'active_support'
require 'active_support/core_ext/object/with_options'
require 'active_support/core_ext/string/inflections'
module ActiveModelSerializers
  extend ActiveSupport::Autoload
  autoload :Model
  autoload :CachedSerializer
  autoload :FragmentCache
  autoload :Callbacks
  autoload :Deserialization
  autoload :SerializableResource
  autoload :Logging
  autoload :Test
  autoload :Adapter
  autoload :JsonPointer
  autoload :Deprecate

  class << self; attr_accessor :logger; end
  self.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))

  def self.config
    ActiveModel::Serializer.config
  end

  # The file name and line number of the caller of the caller of this method.
  def self.location_of_caller
    caller[1] =~ /(.*?):(\d+).*?$/i
    file = Regexp.last_match(1)
    lineno = Regexp.last_match(2).to_i

    [file, lineno]
  end

  require 'active_model/serializer/version'
  require 'active_model/serializer'
  require 'active_model/serializable_resource'
  require 'active_model_serializers/railtie' if defined?(::Rails)
end
