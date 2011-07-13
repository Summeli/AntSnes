/*
 * Snes9x - Portable Super Nintendo Entertainment System (TM) emulator.
 *
 * (c) Copyright 1996 - 2001 Gary Henderson (gary.henderson@ntlworld.com) and
 *                           Jerremy Koot (jkoot@snes9x.com)
 *
 * Super FX C emulator code 
 * (c) Copyright 1997 - 1999 Ivar (ivar@snes9x.com) and
 *                           Gary Henderson.
 * Super FX assembler emulator code (c) Copyright 1998 zsKnight and _Demo_.
 *
 * DSP1 emulator code (c) Copyright 1998 Ivar, _Demo_ and Gary Henderson.
 * C4 asm and some C emulation code (c) Copyright 2000 zsKnight and _Demo_.
 * C4 C code (c) Copyright 2001 Gary Henderson (gary.henderson@ntlworld.com).
 *
 * DOS port code contains the works of other authors. See headers in
 * individual files.
 *
 * Snes9x homepage: http://www.snes9x.com
 *
 * Permission to use, copy, modify and distribute Snes9x in both binary and
 * source form, for non-commercial purposes, is hereby granted without fee,
 * providing that this license information and copyright notice appear with
 * all copies and any derived work.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event shall the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Snes9x is freeware for PERSONAL USE only. Commercial users should
 * seek permission of the copyright holders first. Commercial use includes
 * charging money for Snes9x or software derived from Snes9x.
 *
 * The copyright holders request that bug fixes and improvements to the code
 * should be forwarded to them so everyone can benefit from the modifications
 * in future versions.
 *
 * Super NES and Super Nintendo Entertainment System are trademarks of
 * Nintendo Co., Limited and its subsidiary companies.
 */
#ifndef _PORT_H_
#define _PORT_H_


// horrible mess here

int yo_rand(void);

// debug
#ifdef __DEBUG_PRINT
#undef printf
extern "C" void dprintf(char *format, ...);
#define printf dprintf
#else
#define  printf(x...)
#define dprintf(x...)
#endif

#include <string.h>

#define PIXEL_FORMAT RGB565
#undef GFX_MULTI_FORMAT

#ifndef snes9x_types_defined
#define snes9x_types_defined

typedef unsigned char bool8;
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef signed char int8;
typedef signed short int16;
typedef signed int int32;
typedef unsigned int uint32;
typedef long long int64; // correct?
#endif

#include "pixform.h"

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#if defined(__cplusplus) || defined(c_plusplus)
#define EXTERN_C extern "C"
#define START_EXTERN_C extern "C" {
#define END_EXTERN_C }
#else
#define EXTERN_C extern
#define START_EXTERN_C
#define END_EXTERN_C
#endif


#ifndef PATH_MAX
#define PATH_MAX 0x100 // == KMaxFileName
#endif

/*
#define _MAX_DIR PATH_MAX
#define _MAX_DRIVE 1
#define _MAX_FNAME PATH_MAX
#define _MAX_EXT 3
*/
#define _MAX_PATH PATH_MAX


#define ZeroMemory(a,b) memset((a),0,(b))

EXTERN_C void S9xGenerateSound ();

#define SLASH_STR "\\"
#define SLASH_CHAR '\\'

#define LSB_FIRST
#define STATIC static
#define FASTCALL 
#define INLINE inline
#define VOID void
#define PACKING __attribute__ ((packed))
#define ALIGN_BY_ONE  __attribute__ ((aligned (1), packed))
#define gp32_pause()
#define gm_memset memset
#define CHECK_SOUND()
#define CPU_SHUTDOWN
#define VAR_CYCLES
#define SPC700_C
#define EXECUTE_SUPERFX_PER_LINE
#define OLD_COLOUR_BLENDING
#define _NEWPPU_
#define gp32_atoi atoi
//#define SPC700_SHUTDOWN // incompatible with ASM_SPC700
// notaz
//#define ASM_SPC700
#define SUPER_FX

#ifndef TITLE
#define TITLE "Snes9x"
#endif

#endif // _PORT_H_
