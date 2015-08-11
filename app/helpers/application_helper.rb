module ApplicationHelper
  def pretty_price(price)
    if price.present?
      number_with_delimiter(price, delimiter: " ", separator: ",") + content_tag(:span, 'a', class: 'rouble')
    end
  end
end
