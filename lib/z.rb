# frozen_string_literal: true

require_relative "z/version"
require_relative "z/core"
require_relative "z/data_store"

module Z
  class Error < StandardError; end

  def self.run(param)
    ds = Z::DataStore.new
    Z::Core.new(ds).recommendation(param)
  end

  def self.add(param)
    ds = Z::DataStore.new
    Z::Core.new(ds).store(param)
  end
end

# if ARGV[2] != "add"
#   puts ARGV[3]
# end


