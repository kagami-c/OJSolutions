# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} head
    # @return {boolean}
    def isPalindrome(self, head):
        length = self.getListLength(head)
        if length <= 1:
            return True
        nodeB = nodeC = head
        nodeA = None
        positionC = length // 2 + length % 2
        for i in range(positionC):
            nodeC = nodeC.next
        positionB = length // 2
        for i in range(positionB):
            tempNode = nodeB.next
            nodeB.next = nodeA
            nodeA = nodeB
            nodeB = tempNode
        while nodeA:  # and node C
            if nodeA.val != nodeC.val:
                return False
            tempNode = nodeA.next
            nodeA.next = nodeB
            nodeB = nodeA
            nodeA = tempNode
            nodeC = nodeC.next
        return True

    def getListLength(self, head):
        i = 0
        node = head
        while node:
            i += 1
            node = node.next
        return i