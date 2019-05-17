class User < ActiveRecord::Base
  def self.fetch!(usercode)
    lock.find_or_create_by!(usercode: usercode)
  end

  def advice!(amount)
    receive!(amount)
    increment!(:advice_count)
  end

  def memo!(amount)
    receive!(amount)
    increment!(:memo_count)
  end

  def output!(amount)
    receive!(amount)
    increment!(:output_count)
  end

  def pay!(amount)
    decrement!(:coin, amount)
  end

  def receive!(amount)
    increment!(:coin, amount)
  end

  def tip!(_bot, _command, usercode, amount, *others)
    raise ZeroOneBot::Error, 'Error: @01coin tip <@username> <amount>' if others.present?
    raise ZeroOneBot::Error, 'Error: invalid amount' if amount.to_i <= 0 || coin < amount.to_i
    raise ZeroOneBot::Error, 'Error: invalid username' unless usercode.match(/<@(.+?)>/)
    User::Tip.new(self, $1, amount).call!
  end
end
