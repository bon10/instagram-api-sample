class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :setting, dependent: :destroy, autosave: true

  after_create :save_setting

  def update_or_create_insta_info(insta, auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    self.provider       = auth_hash[:provider]
    self.uid            = auth_hash[:uid]
    self.username       = insta["username"]
    self.follower_count = insta["followers_count"]
    self.follow_count   = insta["follows_count"]

    # 関連のsettingsも更新する
    self.setting.update_insta_coordination
    self.save!
  end

  #---------------------------------
  # private
  #---------------------------------
  private

  # 1対1の関連となっているsettingを、Userのcreate後に生成
  def save_setting
    setting = self.build_setting
    setting.save
  end
end
