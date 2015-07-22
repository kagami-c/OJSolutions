class Solution:
    # @param {integer[]} nums
    # @param {integer} val
    # @return {integer}
    def removeElement(self, nums, val):
        if not nums:
            return 0
        index = 0
        endIndex = len(nums) - 1
        while index < endIndex:
            if nums[index] == val:
                nums[index] = nums[endIndex]
                endIndex -= 1
            else:
                index += 1
        if nums[endIndex] == val:
            endIndex -= 1
        return endIndex + 1
