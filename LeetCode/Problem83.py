# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} head
    # @return {ListNode}
    def deleteDuplicates(self, head):
        if not head:
            return None
        nodeA = head
        nodeB = head.next
        while nodeB:
            if nodeA.val == nodeB.val:
                nodeB = nodeB.next
                nodeA.next = nodeB
            else:
                nodeB = nodeB.next
                nodeA = nodeA.next
        return head
