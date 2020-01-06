def to_rna(dna_strand):
    nucleotides = {'C': 'G', 'G': 'C', 'T': 'A', 'A': 'U'}
    rna_strand = ''

    for nucleotide in dna_strand:
        rna_strand += nucleotides[nucleotide]

    return rna_strand
