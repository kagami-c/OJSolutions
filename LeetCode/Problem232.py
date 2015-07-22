class Queue:
    # initialize your data structure here.
    def __init__(self):
        self.stackA = []
        self.stackB = []

    # @param x, an integer
    # @return nothing
    def push(self, x):
        if self.stackB:
            while self.stackB:
                self.stackA.append(self.stackB.pop())
        self.stackA.append(x)

    # @return nothing
    def pop(self):
        if self.stackA:
            while self.stackA:
                self.stackB.append(self.stackA.pop())
        self.stackB.pop()

    # @return an integer
    def peek(self):
        if self.stackA:
            while self.stackA:
                self.stackB.append(self.stackA.pop())
        return self.stackB[-1]

    # @return an boolean
    def empty(self):
        return not (self.stackA or self.stackB)