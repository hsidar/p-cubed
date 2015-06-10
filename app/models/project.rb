class Project < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "320x320#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :statuses
  has_many :pictures
  validates :title, presence: true
  validates :description, presence: true
end
