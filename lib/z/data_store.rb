require "sqlite3"

module Z
  class DataStore
    attr_accessor :db

    def store(path)
      @db.execute "insert into bookmarks values ( ?, ?, ? )", path, 0, nil
    end

    def fetch(param)
      @db.execute "select path from bookmarks where path like '%#{param}%'"
    end

    def prepare_datastore
      # Create a table
      # returns rows
      @db.execute <<-SQL
        create table if not exists bookmarks (
          path text,
          rank int,
          deleted_at timestamp
          );
      SQL
    end

    def load_database(ds_name)
      @db = SQLite3::Database.new ds_name
    end
  end
end
