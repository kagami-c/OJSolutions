class Solution:
    # @param {integer[]} digits
    # @return {integer[]}
    def plusOne(self, digits):
        carry = 1
        index = len(digits) - 1
        while carry and index >= 0:
            if digits[index] + 1 >= 10:
                digits[index] = 0
            else:
                digits[index] += 1
                carry = 0
            index -= 1
        if carry == 1:
            return [1] + digits
        else:
            return digits