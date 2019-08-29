class Transfer

  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
  end

  def execute_transaction
    if valid? && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

def reverse_transfer
  if self.status == "complete" && self.receiver.balance > self.amount
    self.receiver.balance -= self.amount
    self.sender.balance += self.amount
    self.status = "reversed"
  end
end

end
