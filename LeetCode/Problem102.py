# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param {TreeNode} root
    # @return {integer[][]}
    def levelOrder(self, root):
        if not root:
            return []
        left = self.levelOrder(root.left)
        right = self.levelOrder(root.right)
        result = []
        while left and right:
            result.append(left[0] + right[0])
            del left[0]
            del right[0]
        if left:
            result += left
        elif right:
            result += right
        return [[root.val]] + result