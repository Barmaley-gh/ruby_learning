#Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуется:
#Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
#Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

shopping_cart = {}
total_sum = 0

loop do
  print "Введите название купленного товара: "
  product_name = gets.chomp.downcase
  break if product_name == "стоп"
  puts "Введите цену за единицу купленного товара: "
  product_price = gets.chomp.to_f
  print "Введите кол-во купленного товара: "
  product_quantity = gets.chomp.to_f

  product = {
    price: product_price,
    quantity: product_quantity,
    sum: (product_price * product_quantity)
  }

  total_sum += product[:sum]
  shopping_cart[product_name.to_sym] = product

  puts "Вы добавили в корзину #{product_name} на сумму #{product[:sum]} рублей"
end

puts "Проверьте Вашу корзину #{shopping_cart}"
print "Общая стоимость товаров составит #{total_sum} рублей, подтверждаете покупку? (введите Да, если подтверждаете и Нет, если отказываетесь от покупки): "
  response = gets.chomp.downcase
  if response == "да"
    puts "Оплачено"
  elsif response == "нет"
    puts "Очень жаль"
  else
    puts "Я Вас не понимаю, Да или Нет?"
  end