#Заполнить массив числами фибоначчи до 100

arr = [0, 1]
(0..100).each do |i|
  fibb = arr << arr[i] + arr[i+1]
    fibb.each do |f|
      puts f if f < 100
    end
end