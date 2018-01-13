
require 'digest'
require 'securerandom'

puts 'Witamy w konsoli zmiany hasła :)'
puts 'Jak ma brzmieć nowe hasło?'
new_pass = gets
puts 'Powtórz nowe hasło'
repeat_pass = gets

if new_pass == repeat_pass
  salt = SecureRandom.hex(16)
  timestamp = Time.now.getutc.to_i
  hashedpass = Digest::SHA512.hexdigest(salt + '#' + new_pass.delete("\n") +
    '#' + timestamp.to_s)
  pass = salt + ':' + hashedpass + ':' + timestamp.to_s
  pass_file = File.open('password.txt', 'w')
  pass_file.write(pass)
  pass_file.close
  puts 'Hasło zostało zapisane'
else
  puts 'Powtórzone hasło nie zgadza się z pierwotnym!'
end
