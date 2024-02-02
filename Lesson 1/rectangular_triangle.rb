puts "Укажите длину первой стороны треугольника"
  a = gets.chomp.to_i

puts "Укажите длину второй стороны треугольника"
  b = gets.chomp.to_i

puts "Укажите длину третьей стороны треугольника"
  c = gets.chomp.to_i

hypotenuse = [a, b, c].max
katets_sqr_sum = [a, b, c].min(2).map { |k| k * k }.sum

if a == b && b == c
  puts "Ваш треугольник равносторонний"
elsif katets_sqr_sum == (hypotenuse * hypotenuse)
  puts "Ваш треугольник прямоугольный"
elsif a == b || a == c || b == c
  puts "Ваш треугольник равнобедренный"
else
  puts "У вас квадрат"
end