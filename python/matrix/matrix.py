class Matrix(object):
    def __init__(self, matrix_string):
        self.data = []
        for row in matrix_string.split("\n"):
            self.data.append(map(int, row.split(" ")))

    def row(self, index):
        return self.data[index - 1]

    def column(self, index):
        return [row[index - 1] for row in self.data]
