$:.unshift(File.dirname(__FILE__))

require 'dotenv/load'
require 'zero-one-bot'
require 'web'

Thread.new do
  begin
    ZeroOneBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run ZeroOneBot::Web
