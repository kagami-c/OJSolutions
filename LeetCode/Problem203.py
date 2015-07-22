# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} head
    # @param {integer} val
    # @return {ListNode}
    def removeElements(self, head, val):
        if not head:
            return head
        nodeA = None
        nodeB = head
        while nodeB:
            if nodeB.val == val:
                if nodeB == head:
                    nodeA = nodeB
                    nodeB = nodeB.next
                    del nodeA
                    head = nodeB
                else:
                    nodeA.next = nodeB.next
                    del nodeB
                    nodeB = nodeA.next
            else:
                nodeA = nodeB
                nodeB = nodeB.next
        return head
