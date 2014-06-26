class Comment < ActiveRecord::Base
  belongs_to :article
 # def article
 #   Article.find post_id
 # end

end
