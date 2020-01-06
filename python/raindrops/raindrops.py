def convert(number):
    raindrops = ''
    sounds = {3: 'Pling', 5: 'Plang', 7: 'Plong'}

    for factor in sounds.keys():
      if number % factor == 0:
        raindrops += sounds[factor]

    return raindrops if raindrops else str(number)
