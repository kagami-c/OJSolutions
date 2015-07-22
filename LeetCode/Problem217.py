class Solution:
    # @param {integer[]} nums
    # @return {boolean}
    def containsDuplicate(self, nums):
        if not nums:
            return False
        maxValue, minValue = self.findMaxAndMin(nums)
        flags = [False for i in range(minValue, maxValue + 1)]
        for num in nums:
            if not flags[num - minValue]:
                flags[num - minValue] = True
            else:
                return True
        return False

    def findMaxAndMin(self, nums):
        maxValue = nums[0]
        minValue = nums[0]
        for i in range(1, len(nums)):
            if nums[i] > maxValue:
                maxValue = nums[i]
            if nums[i] < minValue:
                minValue = nums[i]
        return maxValue, minValue

    ## Another version using the standard library
    # def containsDuplicate(self, nums):
    #     if not nums:
    #         return False
    #     numsSet = set(nums)
    #     if len(numsSet) == len(nums):
    #         return False
    #     else:
    #         return True