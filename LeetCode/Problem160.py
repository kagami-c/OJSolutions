# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param two ListNodes
    # @return the intersected ListNode
    def getIntersectionNode(self, headA, headB):
        lengthA = self.getListLength(headA)
        lengthB = self.getListLength(headB)
        nodeA = headA
        nodeB = headB
        if not lengthA or not lengthB:
            return None
        if lengthA > lengthB:
            lengthA, lengthB = lengthB, lengthA
            nodeA, nodeB = nodeB, nodeA
        extra = lengthB - lengthA
        if not extra:
            if nodeA.val == nodeB.val and nodeA.next == nodeB.next:
                return nodeA
        for i in range(extra):
            if extra - i and nodeB.next == nodeA:
                return nodeA
            nodeB = nodeB.next
        while nodeA.next:  # and nodeB
            if nodeA.next == nodeB.next:
                return nodeA.next
            nodeA = nodeA.next
            nodeB = nodeB.next
        return None

    def getListLength(self, head):
        i = 0
        node = head
        while node:
            i += 1
            node = node.next
        return i
