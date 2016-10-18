#!../../bin/linux-x86_64/pv

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/pv.dbd"
pv_registerRecordDeviceDriver pdbbase

epicsEnvSet("N",           "04")
epicsEnvSet("P",           "ESB:PV$(N)")
epicsEnvSet("DESC",        "1 PV Scan")
epicsEnvSet("SCRIPT",      "/afs/slac/g/testfac/extras/scripts/pvScan/R3.2/nlcta/pvScan-nlcta-1pv.py")
epicsEnvSet("SCRIPTABORT", "/afs/slac/g/testfac/extras/scripts/pvScan/R3.2/nlcta/pvScan-nlcta-1pv-abort.py")

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
