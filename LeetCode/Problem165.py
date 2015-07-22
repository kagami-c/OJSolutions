class Solution:
    # @param {string} version1
    # @param {string} version2
    # @return {integer}
    def compareVersion(self, version1, version2):
        v1List = version1.split('.')
        v2List = version2.split('.')
        while v1List and v2List:
            v1Ver = v1List[0]
            v2Ver = v2List[0]
            if v1Ver != v2Ver:
                if int(v1Ver) > int(v2Ver):
                    return 1
                elif int(v1Ver) < int(v2Ver):
                    return -1
            del v1List[0]
            del v2List[0]
        if not v1List and not v2List:
            return 0
        else:
            if not v1List:
                for i in v2List:
                    if int(i) != 0:
                        return -1
                return 0
            elif not v2List:
                for i in v1List:
                    if int(i) != 0:
                        return 1
                return 0