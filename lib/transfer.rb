require_relative './bank_account.rb'

class Transfer
  
    attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid? && sender.balance > @amount
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
