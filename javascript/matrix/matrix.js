export class Matrix {
  constructor(matrix_string) {
    this.data = [];
    for (const row of matrix_string.split("\n")) {
      this.data.push(row.split(" ").map(Number));
    }
  }

  get rows() {
    return this.data;
  }

  get columns() {
    let columns = [];
    for (let i = 0; i < this.data.length; i++) {
      columns.push(this.data.map(function(row) {return row[i];}))
    }
    return columns;
  }
}
