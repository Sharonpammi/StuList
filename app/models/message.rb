class Message < ActiveRecord::Base
 belongs_to :user

 default_scope -> { order('created_at DESC') }
 validates :FromUserId, presence: true
 validates :user_id, presence: true

 	def user_owns
# 		Message.where('"FromUserId" = ? or "user_id" = ?', (:FromUserId, id)
 	end

end
