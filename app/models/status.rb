class Status < ActiveRecord::Base
  belongs_to :project
  validates :content, presence: true
end
