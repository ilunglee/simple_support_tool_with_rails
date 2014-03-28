class Ticket < ActiveRecord::Base
  validates_presence_of  :name, message: "must have a title" 
  validates_presence_of  :email, message: "must have a email" 

  default_scope { order("status ASC").order("created_at DESC")}
end
