require "sqlite3"

module Z
  class DataStore
    attr_accessor :db

    def initialize
      load_database
      prepare_datastore
    end

    def store(path)
      @db.execute "insert into bookmarks values ( ?, ?, ? )", path, 0, nil
    end

    def fetch(param)
      @db.execute "select path from bookmarks where path like '%#{param}%' limit 1"
    end

    private

    def prepare_datastore
      # Create a table
      rows = @db.execute <<-SQL
        create table if not exists bookmarks (
          path text,
          rank int,
          deleted_at timestamp
          );
      SQL
    end

    def load_database
      @db = SQLite3::Database.new "test.db"
    end
  end
end
