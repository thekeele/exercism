class Complement
  def self.of_dna(rna)
    nucleotides = {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}
    rna.chars.map{|nucleotide| nucleotides[nucleotide]}.join
  end
end
