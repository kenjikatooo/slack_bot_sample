module ZeroOneBot
  module Commands
    class Base < SlackRubyBot::Commands::Base
      def self.handle_error(client, data)
        yield
      rescue ZeroOneBot::Error => e
        client.say(text: e.message, channel: data.channel, thread_ts: data.thread_ts || data.ts)
      end
    end
  end
end
