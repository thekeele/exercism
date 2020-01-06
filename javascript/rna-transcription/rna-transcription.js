export const toRna = (dna_strand) => {
  let nucleotides = {'C': 'G', 'G': 'C', 'T': 'A', 'A': 'U'};
  let rna_strand = '';

  for (const nucleotide of dna_strand) {
    rna_strand += nucleotides[nucleotide];
  }

  return rna_strand;
};
