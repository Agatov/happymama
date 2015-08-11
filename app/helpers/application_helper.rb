module ApplicationHelper
  def pretty_price(price)
    if price.present?
      number_with_delimiter(price, delimiter: " ", separator: ",") + content_tag(:span, 'a', class: 'rouble')
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

end
