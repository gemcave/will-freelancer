class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable,
				 :omniauthable

	validates :full_name, presence: true, length: {maximum: 50}

	def self.from_omniauth(auth)
		user = User.where(email: auth.info.email).first

		if user
			return user
		else
			where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
				user.email = auth.info.email
				user.password = Devise.friendly_token[0, 20]
				user.full_name = auth.info.name   # assuming the user model has a name
				user.image = auth.info.image # assuming the user model has an image
				

				user.uid = auth.uid
				user.provider = auth.provider
			end
		end
	end
end
