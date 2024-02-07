#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)

vowels = ['a','f','h','u','z']
vowels_place = {}
initial_letter = 'a'.ord - 1

vowels.each do |vowel|
  vowels_place[vowel] = vowel.ord - initial_letter
end

puts vowels_place