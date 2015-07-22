class Stack:
    # initialize your data structure here.
    def __init__(self):
        self.queue = []

    # @param x, an integer
    # @return nothing
    def push(self, x):
        self.queue.append(x)

    # @return nothing
    def pop(self):
        for i in range(len(self.queue) - 1):
            temp = self.queue.pop()
            self.queue.append(temp)
        self.queue.pop()

    # @return an integer
    def top(self):
        for i in range(len(self.queue) - 1):
            temp = self.queue.pop()
            self.queue.append(temp)
        num = self.queue.pop()
        self.queue.append(num)
        return num

    # @return an boolean
    def empty(self):
        return False if len(self.queue) else True