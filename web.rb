require 'sinatra/base'

module ZeroOneBot
  class Web < Sinatra::Base
    get '/' do
      'Success'
    end
  end
end
