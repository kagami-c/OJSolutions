class Solution:
    # @param {string} s
    # @return {integer}
    def titleToNumber(self, s):
        charList = list(s)
        answer = 0
        for char in charList:
            bit = ord(char) - ord('A') + 1
            answer = answer * 26 + bit
        return answer
