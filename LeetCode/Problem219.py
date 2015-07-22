class Solution:
    # @param {integer[]} nums
    # @param {integer} k
    # @return {boolean}
    def containsNearbyDuplicate(self, nums, k):
        if not nums:
            return False
        if len(set(nums)) == len(nums):
            return False
        for index in range(len(nums) - 1):
            end = min(index + k + 1, len(nums))
            for testIndex in range(index + 1, end):
                if nums[index] == nums[testIndex]:
                    return True
        return False
