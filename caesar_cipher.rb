def caesar_cipher(str, shift)
    alphabet = ("a".."z").to_a
    encoded = ""
    str.each_char do |char|
        encoded << " " if char == " "
        curr_index = alphabet.find_index(char)
        new_index = (curr_index + shift) % alphabet.count
        encoded += alphabet[new_index]
    end
    encoded
end