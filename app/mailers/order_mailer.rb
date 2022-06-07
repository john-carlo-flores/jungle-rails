class OrderMailer < ApplicationMailer
  
  def receipt
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: "Jungle Order Receipt ID##{@order.id}")
  end
end
