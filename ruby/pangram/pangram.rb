class Pangram
  def self.pangram?(sentence)
    alphabet = ('a'..'z').to_a
    pangram = []

    sentence.chars.each do |char|
      char = char.downcase
      if alphabet.include?(char) and not pangram.include?(char)
        pangram.push(char)
      end
    end

    pangram.sort == alphabet
  end
end
