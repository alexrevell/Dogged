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

# class BaseMandrillMailer < ActionMailer::Base

#   default(
#     from: "hello@dogged.com",
#     reply_to: "hello@dogged.com"
#   )

#   private

#   def send_mail(email, subject, body)
#     mail(to: email, subject: subject, body: body, content_type: "text/html")
#   end

#   def mandrill_template(template_name, attributes)
#     mandrill = Mandrill::API.new("o3M3fgH8NBKZOrVezZfpLw")

#     merge_vars = attributes.map do |key, value|
#       { name: key, content: value }
#     end

#     mandrill.templates.render(template_name, [], merge_vars)["html"]
#   end
# end


# class RegistrationMailer < BaseMandrillMailer

#   # def welcome(user_id)
#   #   user = User.find(user_id)
#   #   subject = "Welcome to our awesome app!"
#   #   merge_vars = {
#   #     "FIRST_NAME" => user.first_name,
#   #     "USER_URL" => user_url(user),
#   #   }
#   #   body = mandrill_template("welcome", merge_vars)

#   #   send_mail(user.email, subject, body)
#   # end

#   def dogged_registration(user, dog)
#     @user = user
#     @dog = dog

#     subject = 'Dogged dog registration'
#     merge_vars = {
#       'USER_NAME' => @user.name,
#       'DOG_NAME' => @dog.name,
#       'DOG_REGISTERED_UNTIL' => @dog.registered_until,
#       'DOG_REGISTRATION_FEE' => @dog.registration_cost
#     }
#     body = mandrill_template("dogged-registration", merge_vars)
#   send_mail(@user.email, subject, body)

#   end

#   # Mandrill::API.new(ENV["SMTP_PASSWORD"])

#   # def send_mail(email, subject, body)
#   #   mail(to: email, subject: subject, body: body, content_type: "text/html")
#   # end

# end
