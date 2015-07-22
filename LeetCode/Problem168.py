class Solution:
    # @param {integer} n
    # @return {string}
    def convertToTitle(self, n):
        if not n:
            return ""
        result = []
        while n:
            n -= 1
            remain = n % 26
            n = n // 26
            result.append(chr(ord('A') + remain))
        return ''.join(result[::-1])
