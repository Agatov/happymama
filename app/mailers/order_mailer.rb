class OrderMailer < ActionMailer::Base
  default from: 'order@lifepearl.ru'

  def new_order(order)
    @order = order
    mail(to: "evgeniya@lifepearl.ru, abardacha@gmail.com", subject: "Поступила новая заявка")
  end
end