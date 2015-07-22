class Solution:
    # @param {integer[]} nums
    # @param {integer} k
    # @return {void} Do not return anything, modify nums in-place instead.
    def rotate(self, nums, k):
        if not nums or not k or len(nums) == k:
            return
        if len(nums) < k:
            k = k - len(nums)
        rotateNums = nums[-k:]
        endIndex = len(nums) - 1
        while endIndex - k >= 0:
            nums[endIndex] = nums[endIndex - k]
            endIndex -= 1
        for index, value in enumerate(rotateNums):
            nums[index] = value
        return
