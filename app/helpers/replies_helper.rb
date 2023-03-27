module RepliesHelper
  
  def get_username_from_reply(reply)
    return Account.find(reply.account_id).username
  end
end
