class Project < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :normal => "500x500>", :preview => "300x300#" }, :default_url => "/images/:style/missing.png"
  belongs_to :user
  has_many :statuses
  has_many :pictures
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true
end
