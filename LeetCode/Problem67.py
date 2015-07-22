class Solution:
    # @param {string} a
    # @param {string} b
    # @return {string}
    def addBinary(self, a, b):
        bitsA = list(a)
        bitsB = list(b)
        if len(bitsA) > len(bitsB):
            bitsA, bitsB = bitsB, bitsA
        endIndexA = len(bitsA) - 1
        endIndexB = len(bitsB) - 1
        result = []
        carry = 0
        while endIndexA >= 0:
            bit = int(bitsA[endIndexA]) + int(bitsB[endIndexB]) + carry
            carry = 0
            if bit >= 2:
                bit %= 2
                carry = 1
            result.append(str(bit))
            endIndexA -= 1
            endIndexB -= 1
        while endIndexB >= 0:
            bit = int(bitsB[endIndexB]) + carry
            carry = 0
            if bit >= 2:
                bit %= 2
                carry = 1
            result.append(str(bit))
            endIndexB -= 1
        if carry:
            result.append(str(carry))
        return ''.join(result[::-1])
