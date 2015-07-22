# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param {TreeNode} root
    # @param {integer} sum
    # @return {boolean}
    def hasPathSum(self, root, sum):
        # recursive version
        if not root:
            return False
        if not root.left and not root.right:
            if root.val == sum:
                return True
            else:
                return False
        sumOfChilds = sum - root.val
        if root.left:
            if self.hasPathSum(root.left, sumOfChilds):
                return True
        if root.right:
            if self.hasPathSum(root.right, sumOfChilds):
                return True
        return False
