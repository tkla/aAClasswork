class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true 
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true 
    validates :password, allow_nil: true, length: {minimum: 6}
    before_validation :ensure_session_token 

    attr_reader :password 

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

    

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user 
        else 
            nil 
        end
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save! 
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token 
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end
