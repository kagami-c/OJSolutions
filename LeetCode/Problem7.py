class Solution:
    # @param {integer} x
    # @return {integer}
    def reverse(self, x):
        factor = 1
        if x < 0:
            factor = -1
            x = -x
        output = 0
        while x:
            bit = x % 10
            x = x // 10
            output = output * 10 + bit
        answer = output * factor
        if answer > 2147483647 or answer < -2147483648:  # overflow test
            answer = 0
        return answer
