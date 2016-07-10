#!/usr/bin/ruby

require 'mysql2'

begin
  client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "mysql")
  results = client.query("SELECT * FROM user WHERE Host='localhost'")

  results.each do |row|
    puts row["User"]
  end

rescue Mysql2::Error => e
  puts e.errno
  puts e.error

end