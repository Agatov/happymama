class OrderMailer < ActionMailer::Base
  default from: 'order@lifepearl.ru'

  def new_order(order)
    @order = order
    mail(to: "sofota@gmail.com, abardacha@gmail.com", subject: "Поступила новая заявка")
  end
end