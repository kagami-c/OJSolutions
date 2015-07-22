class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        reversedNum = 0
        for i in range(32):
            reversedNum *= 2
            remain = n % 2
            n = n // 2
            if remain:
                reversedNum += 1
        return reversedNum