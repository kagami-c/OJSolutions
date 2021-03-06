# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} node
    # @return {void} Do not return anything, modify node in-place instead.
    def deleteNode(self, node):
        while node.next and node.next.next:
            node.val = node.next.val
            node = node.next
        assert node.next
        node.val = node.next.val
        del node.next
        node.next = None
