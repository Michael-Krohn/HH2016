:!/bin/sh

#python generalTreeAnalyzer_76X.py --pathIn=/eos/uscms/store/group/lpchbb/HeppyNtuples/V21/JetHT/VHBB_HEPPY_V21_JetHT__Run2015C_25ns-16Dec2015-v1/160318_132855/0000/ --outName=Jet_HT_C --trigger=False --jets=True --deta=True --min=0 --max=31 --file=TxtFiles/76XRunC.txt &
./cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
scramv1 project CMSSW CMSSW_8_0_12
cd CMSSW_8_0_12/src
eval `scramv1 runtime -sh`
cp ../../generalTreeAnalyzer_76X.py .
cp ../../QCD_HT1500to2000_Skimmed.txt .
cp ../../trigger_objects.root .

python generalTreeAnalyzer_76X.py --pathIn=root://cmsxrootd.fnal.gov//store/user/mkrohn/HHTo4b/SkimmedHeppy_nTuples/ --outName=QCD_HT1500to2000 --trigger=False --jets=True --deta=True --isMC=True --xsec=119.9 --min=0 --max=1 --file=QCD_HT1500to2000_Skimmed.txt

xrdcp QCD_HT1500to2000_0.root root://cmseos.fnal.gov//store/user/mkrohn/HHTo4b/SkimmedHeppy_nTuples/miniTrees/
