class Setting < ApplicationRecord
  belongs_to :user

  def update_insta_coordination
    self.is_insta = true unless self.is_insta
  end
end
