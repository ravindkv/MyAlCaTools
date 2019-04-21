
############################################
# get AlCa conditions consumed in the CMSSW
# https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideCalAliTrigger2019
############################################

#input
tagFile = "allAlCaTags.txt"
logFiles = []
logFiles.append("out.log")
logFiles.append("out.log")
logFiles.append("out.log")

#output
outputForTwiki = open("outputForTwiki.txt", 'w')

#define various function
def checkTagInFile(tag, logFile):
    for line in open(logFile):
        if line.find(tag)!=-1:
            #return "%RED% N %ENDCOLOR%"
            return ""
        else:
            #return "%GREEN% Y %ENDCOLOR%"
            return "Y"

def getOneRow(tag, logFiles):
    rowName = "|" +tag.strip()
    for file_ in logFiles:
        checkTagInFile_ = checkTagInFile(tag, file_)
        rowName = rowName + "|" + checkTagInFile_
    return rowName + "| \n"

def printAllRow(tagFile, logFiles, outForTwiki):
    for tag in open(tagFile):
        getOneRow_ = getOneRow(tag, logFiles)
        print getOneRow_
        outForTwiki.write(getOneRow_)

printAllRow(tagFile, logFiles, outputForTwiki)
