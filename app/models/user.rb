class User < ApplicationRecord
  before_save { self.email = email.downcase }   #self.email 代表每個object的email
  has_secure_password
  has_many :articles

  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },  #case_sensitive: false 表示不管大小寫，只要字與字數皆相同就不能用
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end






# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  username    :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#