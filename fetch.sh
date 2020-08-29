#!/usr/bin/env ruby

require 'sqlite3'

begin

    db = SQLite3::Database.open "yaml.db"

    stm = db.prepare "SELECT * FROM Cars LIMIT 5"
    rs = stm.execute

    rs.each do |row|
        puts row.join "\s"
    end

rescue SQLite3::Exception => e
	puts "Exception occurred"
	puts e
rescue SQLite3::BusyException => e
	puts "Error: database busy"
	puts e


# ensure
	db.close if db

end
