module ZeroOneBot
  module Commands
    class Output < ZeroOneBot::Commands::Base
      OUTPUT_REWARD = 100.freeze

      match /^【アウトプット】/ do |client, data, match|
        user = User.fetch!(data.user)
        user.output!(OUTPUT_REWARD)
        client.say(
          text: text(user),
          channel: data.channel,
          thread_ts: data.thread_ts || data.ts
        )
      end

      private

      def self.text(user)
        <<~TEXT
          【アウトプット完了:bulb:】
          アウトプットしました :tada:

          ---------------------------------
          <@#{user.usercode}>
          メモ回数：#{user.memo_count}回
          アウトプット回数：#{user.output_count}回
          アドバイス回数：#{user.advice_count}回
          投げ銭回数：#{user.tip_count}回
          残01coin：#{user.coin}coin
          ---------------------------------
        TEXT
      end
    end
  end
end
