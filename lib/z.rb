# frozen_string_literal: true

require_relative "z/version"
require_relative "z/core"
require_relative "z/data_store"

module Z
  class Error < StandardError; end

  DB_NAME = "z_ds.db"
  DB_PATH = "#{Dir.home}/#{DB_NAME}"

  def self.init
    ds = Z::DataStore.new
    ds.load_database DB_PATH
    ds.prepare_datastore
  end

  def self.run(param)
    ds = DataStore.new
    ds.load_database DB_NAME
    Z::Core.new(ds).recommendation(param)
  end

  def self.add(param)
    ds = Z::DataStore.new
    ds.load_database DB_NAME
    Z::Core.new(ds).store(param)
  end

  def self.all
    ds = Z::DataStore.new
    ds.load_database DB_NAME
    Z::Core.new(ds).dump
  end
end
