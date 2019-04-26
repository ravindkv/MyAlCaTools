#1: GEN
cmsDriver.py TTbar_13TeV_TuneCUETP8M1_cfi  --conditions auto:run2_mc -n 5 --era Run2_2016 -s GEN --fileout output_step1_GEN.root --beamspot Realistic50ns13TeVCollision  --customise_commands='process.GlobalTag.DumpStat =cms.untracked.bool(True)'|& tee output_step1_GEN.log

#2: SIM
cmsDriver.py step2  --conditions auto:run2_mc -n 5 --era Run2_2016 -s SIM --datatier GEN-SIM --eventcontent FEVTDEBUG --filein file:output_step1_GEN.root --fileout output_step2_SIM.root --beamspot Realistic50ns13TeVCollision  --customise_commands='process.GlobalTag.DumpStat =cms.untracked.bool(True)'|& tee output_step2_SIM.log

#3: DIGI
cmsDriver.py step3  --conditions auto:run2_mc -n 5 --era Run2_2016 -s DIGI:pdigi_valid --datatier GEN-SIM-DIGI-RAW --eventcontent FEVTDEBUGHLT --filein file:output_step2_SIM.root --fileout output_step3_DIGI.root  --customise_commands='process.GlobalTag.DumpStat =cms.untracked.bool(True)'|& tee output_step3_DIGI.log

#4: L1
cmsDriver.py step4  --conditions auto:run2_mc -n 5 --era Run2_2016 -s L1 --datatier GEN-SIM-DIGI-RAW --eventcontent FEVTDEBUGHLT --filein file:output_step3_DIGI.root --fileout output_step4_L1.root --customise_commands="process.load('Configuration.StandardSequences.Digi_cff') \n process.GlobalTag.DumpStat =cms.untracked.bool(True)" |& tee output_step4_L1.log

#5: DIGI2RAW
cmsDriver.py step5  --conditions auto:run2_mc -n 5 --era Run2_2016 -s DIGI2RAW --datatier GEN-SIM-DIGI-RAW --eventcontent FEVTDEBUGHLT --filein file:output_step4_L1.root  --fileout output_step5_DIGI2RAW.root --customise_commands='process.GlobalTag.DumpStat =cms.untracked.bool(True)'|& tee output_step5_DIGI2RAW.log

#6: HLT
cmsDriver.py step6  --conditions auto:run2_mc -n 5 --era Run2_2016 -s HLT  --datatier GEN-SIM-DIGI-RAW-HLTDEBUG --eventcontent FEVTDEBUGHLT --filein file:output_step5_DIGI2RAW.root --fileout output_step6_HLT.root --customise_commands='process.GlobalTag.DumpStat =cms.untracked.bool(True)'|& tee output_step6_HLT.log


