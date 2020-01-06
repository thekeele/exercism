export const convert = (number) => {
  let raindrops = '';
  let sounds = {3: 'Pling', 5: 'Plang', 7: 'Plong'};

  for (const factor in sounds) {
    if (number % factor == 0) {
      raindrops += sounds[factor];
    }
  }

  return raindrops ? raindrops : `${number}`;
};
