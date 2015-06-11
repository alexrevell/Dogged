class RegistrationMailer < MandrillMailer::TemplateMailer

  default from: 'hello@dogged.com'

  def dogged_registration(user, dog)
    @user = user
    @dog = dog

    mandrill_mail(
      template: 'dogged-registration',
      subject: 'Dogged Registration',
      to: @user.email,
      vars: {
        'USER_NAME' => @user.name,
        'DOG_NAME' => @dog.name,
        'DOG_REGISTERED_UNTIL' => @dog.registered_until,
        'DOG_REGISTRATION_FEE' => @dog.registration_cost
      },
      important: true,
      inline_css: true
     )
  end
end
