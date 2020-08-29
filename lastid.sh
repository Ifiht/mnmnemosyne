#!/usr/bin/env ruby

require 'sqlite3'

begin

	db = SQLite3::Database.new ":memory"
    db.execute "CREATE TABLE Friends(Id INTEGER PRIMARY KEY, Name TEXT)"
    db.execute "INSERT INTO Friends(Name) VALUES ('Tom')"
    db.execute "INSERT INTO Friends(Name) VALUES ('Rebecca')"
    db.execute "INSERT INTO Friends(Name) VALUES ('Jim')"
    db.execute "INSERT INTO Friends(Name) VALUES ('Robert')"
    db.execute "INSERT INTO Friends(Name) VALUES ('Julian')"

    id = db.last_insert_row_id
    puts "The last id of the inserted row is #{id}"

rescue SQLite3::Exception => e

	puts "Exception occurred"
	puts e

ensure
	db.close if db
end
