export class Series {
  constructor(numbers) {
    this.series = numbers.split('').map(Number);
  }

  get digits() {
    return this.series;
  }

  slices(number) {
    let slices = [];

    if (number > this.series.length) throw new Error('Slice size is too big.');

    for (let i = 0; i < this.series.length; i++) {
      let slice = this.series.slice(i, i + number);

      if (slice.length === number) {
        slices.push(slice);
      }
    }

    return slices;
  }
}
