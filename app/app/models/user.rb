class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_one :setting 

  after_create :save_setting

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    id = auth[:info][:id]

   self.find(provider: provider,uid: uid) do |user|
     user.insta_id = id
     user.username = name
   end
  end

  #---------------------------------
  # private
  #---------------------------------
  private

  def save_setting
    setting = self.build_setting
    setting.save
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
