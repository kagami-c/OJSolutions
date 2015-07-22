class Solution:
    # @param n, an integer
    # @return an integer
    def hammingWeight(self, n):
        counter = 0
        while n > 0:
            remain = n % 2
            if remain:
                counter += 1
            n = n // 2
        return counter