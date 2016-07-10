#!/usr/bin/ruby

require 'mysql2'

class Connection_mysql

  @db = ""

  def initialize

    begin
      @db = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "mysql")
      results = @db.query("SELECT * FROM user WHERE Host='localhost'")

      results.each do |row|
        puts row["User"]
      end

    rescue Mysql2::Error => e
      puts e.errno
      puts e.error

    end

  end

  def test_connection

    puts @db.query("select version()")

  end

end

mysql = Connection_mysql.new()
mysql.test_connection
