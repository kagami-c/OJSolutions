# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} head
    # @return {ListNode}
    def reverseList(self, head):
        nodeA = None
        nodeB = head
        while nodeB:
            tempNode = nodeB.next
            nodeB.next = nodeA
            nodeA = nodeB
            nodeB = tempNode
        return nodeA