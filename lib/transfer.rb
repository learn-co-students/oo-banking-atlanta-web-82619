class Transfer
  attr_accessor :amount, :sender, :receiver, :status 
  
def initialize(sender, receiver, amount)
  @status = "pending"
  @amount = amount 
  @receiver = receiver
  @sender = sender
end 

def valid?
  self.sender.valid? && self.receiver.valid?
end 

def execute_transaction
    if valid? && self.status == "pending" && self.sender.balance > self.amount
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
