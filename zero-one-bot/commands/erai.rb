module ZeroOneBot
  module Commands
    class Erai < ZeroOneBot::Commands::Base
      MEMO_REWARD = 10.freeze

      match /^えらい/ do |client, data, match|
        user = User.fetch!(data.user)
        user.memo!(MEMO_REWARD)
        client.say(
          text: text(user),
          channel: data.channel,
          # スレッドに返信するかどうか（コメントアウトを外せばスレッドに返信する）
          # thread_ts: data.thread_ts || data.ts
        )
      end

      private

      def self.text(user)
        <<~TEXT
          えらい！！
        TEXT
      end
    end
  end
end
