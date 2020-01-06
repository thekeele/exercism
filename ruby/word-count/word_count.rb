class Phrase
  def initialize(word_string)
    @words = word_string.gsub(/[^A-Za-z0-9' ]/, ' ').split(' ').map(&:downcase).map{|w| w.delete_prefix("'").delete_suffix("'")}
  end

  def word_count
    word_count = {}

    @words.each do |word|
      word_count.include?(word) ? word_count[word] += 1 : word_count[word] = 1
    end

    word_count
  end
end
