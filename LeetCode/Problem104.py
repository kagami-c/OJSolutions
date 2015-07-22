# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param {TreeNode} root
    # @return {integer}
    def maxDepth(self, root):
        if not root:
            return 0
        if not root.left and not root.right:
            return 1
        elif root.left and root.right:
            return max(self.maxDepth(root.left), self.maxDepth(root.right)) + 1
        elif root.left:
            return self.maxDepth(root.left) + 1
        elif root.right:
            return self.maxDepth(root.right) + 1
