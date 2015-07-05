#ENTER TEXT AT BOTTOM
#RC4 Cipher Tool
#==============================================================================================================================================

puts "Message: \n"
message = gets.chomp
puts "Password: \n"
password = gets.chomp

#=====================
#James Bond 007 Methods
#=====================
def bin_to_hex(s)
 s.unpack('H*').first
end

def hex_to_bin(s)
 [s].pack('H*').bytes.to_a
end

def rc4(key, data)
	s = (0..255).to_a
	j = 0
	key_bytes = key.bytes.to_a
	for i in 0..255 do
		j = (j + s[i] + key_bytes[i % key.length]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
	end
	i = 0;
	j = 0;
	res = []
	for y in 0..data.length-1 do
		i = (i + 1) % 256;
		j = (j + s[i]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
		res.push(data[y] ^ s[(s[i] + s[j]) % 256]);
	end
	res
end
#========================================================================================================================================

#=====================
#Control Flow
#=====================
#Handle input for mode choice.




puts "Encrypted: \n"
puts bin_to_hex(rc4(password.to_s,  message.bytes.to_a).pack("C*"))
puts "Decrypted: \n"
puts rc4(password.to_s,  hex_to_bin(message.to_s)).pack("C*")
