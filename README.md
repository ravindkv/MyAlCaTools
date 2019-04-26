

### Get AlCa conditions from CMSSW at various steps
https://twiki.cern.ch/twiki/bin/view/CMS/AlCaDBHLT2019

## setup CMSSW
* ssh user@lxplus7.cern.ch
* export SCRAM_ARCH=slc7_amd64_gcc700
* cmsrel CMSSW_10_6_0_pre1
* cd CMSSW_10_6_0_pre1/src/

## setup cmsDrivers
* mkdir runTheMatrix
* cd runTheMatrix
* runTheMatrix.py -e -n -l 1325 
* git clone git@github.com:ravindkv/MyAlCaTools.git
* ./runCMSDrivers.sh
* python getAlCaCondInGT.py

Please note that the following command: 
--customise_commands='process.GlobalTag.DumpStat = cms.untracked.bool(True)'
is used to dump the conditions consumed in the GT.


