class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

  def self.between(sender_id, recipient_id)
    where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end
end
