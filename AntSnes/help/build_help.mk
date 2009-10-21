# ============================================================================
#  Name	 : build_help.mk
#  Part of  : AntSnes
# ============================================================================
#  Name	 : build_help.mk
#  Part of  : AntSnes
#
#  Description: This make file will build the application help file (.hlp)
# 
# ============================================================================

do_nothing :
	@rem do_nothing

# build the help from the MAKMAKE step so the header file generated
# will be found by cpp.exe when calculating the dependency information
# in the mmp makefiles.

MAKMAKE : AntSnes.hlp
AntSnes.hlp : AntSnes.xml AntSnes.cshlp Custom.xml
	cshlpcmp AntSnes.cshlp
ifeq (WINS,$(findstring WINS, $(PLATFORM)))
	copy AntSnes.hlp $(EPOCROOT)epoc32\$(PLATFORM)\c\resource\help
endif

BLD : do_nothing

CLEAN :
	del AntSnes.hlp
	del AntSnes.hlp.hrh

LIB : do_nothing

CLEANLIB : do_nothing

RESOURCE : do_nothing
		
FREEZE : do_nothing

SAVESPACE : do_nothing

RELEASABLES :
	@echo AntSnes.hlp

FINAL : do_nothing
