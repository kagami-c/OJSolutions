class Solution:
    # @param {integer[]} nums
    # @return {integer}
    def majorityElement(self, nums):
        numsDict = {}
        for num in nums:
            if not numsDict.has_key(num):
                numsDict[num] = 0
            numsDict[num] += 1
            if numsDict[num] > len(nums) // 2:
                return num
