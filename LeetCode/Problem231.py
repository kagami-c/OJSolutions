class Solution:
    # @param {integer} n
    # @return {boolean}
    def isPowerOfTwo(self, n):
        if n == 0:
            return False
        elif n == 1 or n == 2:
            return True
        else:
            if n % 2 == 0:
                return self.isPowerOfTwo(n // 2)
            else:
                return False
