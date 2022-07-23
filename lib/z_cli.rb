require "thor"

require_relative "z"

module Z
  class Cli < Thor
    desc "hello NAME", "say hello to NAME"
    def hello(name)
      puts "Hello #{name}"
    end

    desc "init", "Initialise the database"
    def init
      Z.init
    end

    desc "add PATH", "add PATH to bookmark"
    def add(path)
      if path == "."
        Z.add(Dir.pwd)
      end
    end

    desc "run PATH", "get recommendation from bookmark"
    def fetch(path)
      puts Z.run(path)
    end

    desc "all", "all"
    def all
      puts Z.all
    end
  end
end

