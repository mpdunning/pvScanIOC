TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = pv
# pv.dbd will be created and installed
DBD += pv.dbd

# pv.dbd will be made up from these files:
pv_DBD += base.dbd
pv_DBD += asSupport.dbd
#pv_DBD += pvScanSup.dbd

# Include dbd files from all support applications:
#pv_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
pv_LIBS += autosave 

# pv_registerRecordDeviceDriver.cpp derives from pv.dbd
pv_SRCS += pv_registerRecordDeviceDriver.cpp
#pv_SRCS += pvScanASub.c

# Build the main IOC entry point on workstation OSs.
pv_SRCS_DEFAULT += pvMain.cpp
pv_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#pv_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
pv_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

