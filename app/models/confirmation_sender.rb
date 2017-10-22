class ConfirmationSender
  def self.send_confirmation(user)
    verification_code = CodeGenerator.generate
    user.update(verification_code: verification_code)
    MessageSender.send_code(user.phone_number, verification_code)
  end
end
