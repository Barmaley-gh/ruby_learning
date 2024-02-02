puts "Введите коэффициент a"
  a = gets.chomp.to_i
puts "Введите коэффициент b"
  b = gets.chomp.to_i
puts "Введите коэффициент c"
  c = gets.chomp.to_i

discriminant = b**2 - (4 * a * c)

if discriminant > 0
  disc_sqrt = Math.sqrt(discriminant)
  x1 = (-b + disc_sqrt) / (2 * a)
  x2 = (-b - disc_sqrt) / (2 * a)
  puts "#{discriminant}, #{x1}, #{x2}"
elsif discriminant == 0
  x1 = -b / (2 * a)
  puts "#{discriminant}, #{x1}"
else
  puts "#{discriminant}, корней нет"
end