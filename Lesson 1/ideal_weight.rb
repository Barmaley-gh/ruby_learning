puts "Как Вас зовут?"
  name = gets.chomp

puts "Какой у Вас рост (в см)?"
  height = gets.chomp.to_i

weight = ((height - 110) * 1.15).round

if weight >= 0
  puts "Приятно познакомиться, #{name}, Ваш идеальный вес #{weight} кг"
  else
    puts "Отлично, #{name}, Ваш вес уже оптимальный"
end