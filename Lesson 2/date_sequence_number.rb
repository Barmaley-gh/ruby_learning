#5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 

print "Введите день месяца: "
day = gets.chomp.to_i
puts "Введите номер месяца: "
month = gets.chomp.to_i
puts "Введите год: "
year = gets.chomp.to_i

if month >= 1
  days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days_in_month[1] = 29 if (year % 4).zero? && ((year % 100).nonzero? || (year % 400).zero?)
  (month - 1).times.each { |m| day +=days_in_month[m] }
  puts "Этот день #{day} от начала года"
end