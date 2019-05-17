module ZeroOneBot
  module Commands
    class List < ZeroOneBot::Commands::Base

      command 'list' do |client, data, match|
        text = User.all.map{ |u| text(u) }.join("\n")
        client.say(text: text, channel: data.channel)
      end

      private

      def self.text(user)
        <<~TEXT
          <@#{user.usercode}>
          📝メモ回数：#{user.memo_count}回
          🎨アウトプット回数：#{user.output_count}回
          💓アドバイス回数：#{user.advice_count}回
          👏投げ銭回数：#{user.tip_count}回
          💰残りコイン：#{user.coin}coin
          ---------------------------------
        TEXT
      end
    end
  end
end
