class User < Sequel::Model
  def validate
    binding.pry
    errors.add(:login, "can't be empty") if login.nil? || login.empty?
  end
end
