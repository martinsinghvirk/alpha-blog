class User < ActiveRecord::Base
    has_many :articles

    # Gör den angiva e-mailen till små bokstäver innan den lagras i db. 
    before_save { self.email = email.downcase }
    # Validering som kollar att unika värden förekommer samt längd för username och e-mail. För att kolla felkod ange t.ex. (user.errors.full_messages).
    validates :username, presence: true, uniqueness: { case_sensitive: false }, 
        length: { minimum: 3, maximum: 30 }
    # Kollar formatet på angiven e-mail.
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
        length: {maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end