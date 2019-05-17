class User
  class Tip
    def initialize(user, usercode, amount)
      @user   = user
      @target = User.fetch!(usercode)
      @amount = amount.to_i
    end

    def call!
      pay!
      receive!
      increment_tip_count!
      [@target, @amount]
    end

    private

    def pay!
      @user.pay!(@amount)
    end

    def receive!
      @target.receive!(@amount)
    end

    def increment_tip_count!
      @user.increment!(:tip_count)
    end
  end
end
