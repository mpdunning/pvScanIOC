 /* Collection of aSub subroutines...
 *----------------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <dbDefs.h>
//#include <alarm.h>
#include <registryFunction.h>
//#include "subRecord.h"
#include "aSubRecord.h"
#include <epicsExport.h>
#include <math.h>
#include <stdlib.h>

//#define SIZE(x)               (sizeof(x)/sizeof(x[0]))
#define MINMAX_0 1000.0

//typedef unsigned char byte;
//typedef unsigned short word;
//typedef unsigned int uint;

static long asCat(aSubRecord *pr){
/*------------------------------------------------------------------------------
 * Do some stats
 *----------------------------------------------------------------------------*/
    char *strIn= (char*)pr->a;
    char *strOut=(char*)pr->vala;

    char *str2=" CPP MS";

    strcpy(strOut, strIn);
    strcat(strOut, str2);
    printf("strOut=%s\n", strOut);

    return(0);
}

/**************************************************************************/

epicsRegisterFunction(asCat);

