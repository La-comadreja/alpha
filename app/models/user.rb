class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Extensions::DatabaseAuthenticatable
  include Extensions::Confirmable
  include Extensions::Lockable
  include Extensions::Recoverable
  include Extensions::Registerable
  include Extensions::Rememberable
  #include Extensions::Timeoutable
  #include Extensions::TokenAuthenticable
  include Extensions::Trackable
  include Extensions::Validatable
  include Extensions::Omniauthable
  include Extensions::DeviseHelpers
  include Extensions::BetaSignups

  field :username,                :type => String

  attr_accessible :username

  protected

  def self.search(search, page)
    if search
      where(:email => /#{Regexp.quote(search)}/).page(page || 1).per(10)
    else
      page(page || 1).per(10)
    end
  end

end
