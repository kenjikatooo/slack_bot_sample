module ZeroOneBot
  module Commands
    class Tip < ZeroOneBot::Commands::Base

      command 'tip' do |client, data, match|
        ZeroOneBot::Commands::Base.handle_error(client, data) do
          donor = User.fetch!(data.user)
          target, amount = donor.tip!(*data.text.split)
          client.say(
            text: text(donor, target, amount),
            channel: data.channel,
            thread_ts: data.thread_ts || data.ts
          )
        end
      end

      private

      def self.text(donor, target, amount)
        <<~TEXT
          【投げ銭完了:moneybag:】
          <@#{target.usercode}>さんに `#{amount}coin` 支援しました :tada:

          ---------------------------------
          <@#{donor.usercode}>
          📝メモ回数：#{donor.memo_count}回
          🎨アウトプット回数：#{donor.output_count}回
          💓アドバイス回数：#{donor.advice_count}回
          👏投げ銭回数：#{donor.tip_count}回
          💰残りコイン：#{donor.coin}coin
          ---------------------------------
        TEXT
      end
    end
  end
end
