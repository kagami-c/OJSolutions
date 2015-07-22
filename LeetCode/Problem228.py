class Solution:
    # @param {integer[]} nums
    # @return {string[]}
    def summaryRanges(self, nums):
        if not nums:
            return []
        base = nums[0]
        index = 0
        while index < len(nums):
            if nums[index] != base + index:
                break
            index += 1
        if index == 1:
            rangeString = '{}'.format(base)
        else:
            rangeString = '{}->{}'.format(base, base + index - 1)
        return [rangeString] + self.summaryRanges(nums[index:])