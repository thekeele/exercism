//
// This is only a SKELETON file for the 'Pangram' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPangram = (sentence) => {
  let alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
  let pangram = [];

  for (let char of sentence) {
    char = char.toLowerCase();
    if (alphabet.includes(char) && !pangram.includes(char)) {
      pangram.push(char);
    }
  }

  return pangram.sort().toString() == alphabet.toString();
};
