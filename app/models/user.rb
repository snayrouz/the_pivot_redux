class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :user_roles, dependent: :delete_all
  has_many :roles, through: :user_roles
  has_many :stores, through: :user_roles

  validates :first_name, :last_name, :password_digest, presence: true
  validates :phone, presence: :true, on: :create, unless: :oauth_login
  validates :email, presence: :true, on: :create, uniqueness: true, unless: :oauth_login

  def oauth_login
    oauth_token.present?
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      if auth.provider == "twitter"
        user.uid = auth.uid
        user.first_name = auth.info.name.split(" ")[0]
        user.last_name = auth.info.name.split(" ")[1]
        user.email = auth.info.email
        user.address = 'address'
        user.password = '17'
        user.oauth_token = auth.credentials.token
        user.save
      else
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.address = auth.info.address
        user.password = '17'
        user.oauth_token = auth.credentials.token
        user.save
      end
    end
  end

  def full_name
    first_name + " " + last_name
  end

  def date_joined
    created_at.strftime('%b. %d, %Y')
  end

  def self.user_orders
    group(:email).joins(:orders).count
  end

  def self.user_quantity_of_items_ordered
    group(:email).joins(orders: :order_items).sum(:quantity)
  end

  def business_manager?
    roles.exists?(role: "business_manager")
  end

  def business_admin?
    roles.exists?(role: "business_admin")
  end

  def platform_admin?
    platform_admin
  end

end
