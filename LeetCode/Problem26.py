class Solution:
    # @param {integer[]} nums
    # @return {integer}
    def removeDuplicates(self, nums):
        if not nums:
            return 0
        elif len(nums) == 1:
            return 1
        index = 0
        nextIndex = index + 1
        while nextIndex < len(nums):
            if nums[nextIndex] != nums[index]:
                index += 1
                nums[index] = nums[nextIndex]
            nextIndex += 1
        return index + 1
