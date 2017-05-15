class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcom to the Jungle!')
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: "Order Confirmation: Order Number #{@order.id}")
  end

end
