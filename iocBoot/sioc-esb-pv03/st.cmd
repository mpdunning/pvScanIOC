#!../../bin/linux-x86_64/pv

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/pv.dbd"
pv_registerRecordDeviceDriver pdbbase

epicsEnvSet("N",           "03")
epicsEnvSet("P",           "ESB:PV$(N)")
epicsEnvSet("DESC",        "5 Motor Scan")
epicsEnvSet("SCRIPT",      "/afs/slac/g/testfac/extras/scripts/pvScan/prod/nlcta/pvScan-nlcta-5motor.py")
epicsEnvSet("SCRIPTABORT", "/afs/slac/g/testfac/extras/scripts/pvScan/prod/nlcta/pvScan-nlcta-5motor-abort.py")
epicsEnvSet("INPA",        "ESB:XPS1:m6:MOTR.RBV")
epicsEnvSet("INPB",        "$(P):SCANPV2:OFFSET")

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "pv.sav")
set_pass1_restoreFile( "pv.sav")

dbLoadRecords("db/pv.db","P=$(P),IOC=$(IOC),DESC=$(DESC)")
dbLoadRecords("db/nlcta.db","P=$(P)")

#cd ${AUTOSAVE}
#dbLoadRecords( "db/save_restoreStatus.db","P=$(P)")

cd ${TOP}/iocBoot/${IOC}
iocInit

create_monitor_set( "pv.req",30,"P=$(P)")

dbpf $(P):SCRIPT $(SCRIPT)
dbpf $(P):SCRIPT:ABORT $(SCRIPTABORT)
dbpf $(P):RADIUS:AUTOSET.INPA $(INPA)
dbpf $(P):RADIUS:AUTOSET.INPB $(INPB)
