require('uri')

class Link < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
  validates :url, format: { with: URI::regexp(%w(http https)),
                            message: "please include http or https in the link" }

  enum read: [:false, :true]
end
