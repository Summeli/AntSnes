
About
-----

AtnSnes is Snes9x emulator for S60. It is actually based on
OpenSnes9xGP, modified Snes9x for GP32 handheld, which had parts of it
adapted to / totally rewritten for GP32 (in C or ASM). As GP32 is ARM CPU
based device (same as S60 phones), these optimizations were used in this
port.

How to build for Symbian
------------------------
* The S60 3rd edition can be build with normal abld build
* For S60 5th edition The antsnes engine should be compiled with MinGW environment for the S60
  see http://www.summeli.fi/?p=1274
* The UI part is build with normal symbian abld build system.

Problems / limitations
----------------------

* Due to various optimizations emulation accuracy was lost and most games
  have various graphical glitches, some are unplayable at all.
* Some SNES PPU (pucture processing unit) effects cause major slowdowns.
* No Sound support
* SuperFX games eather crash or are totally unplayable (< 1fps).
* No support for SA1.


Credits
-------

This emulator uses code from these people/projects:

Snes9x team:
Gary Henderson, Jerremy Koot, John Weidman and others (see below)
* The emulator itself!
Homepage: http://www.snes9x.com/

Yoyofr and Laxer3a
* All the work in their OpenSnes9xGP: asm CPU core, new PPU code,
  various tweaks
Homepage: http://yoyofr92.free.fr/

notaz
* SPC700 assembly code
* alot of minor code changes.
Homepage: http://notaz.atspace.com/
E-mail: notasas(atsymbol)gmail.com

Summeli
* AntSnes, the S60 port
* minor code changes. 

Additional thanks
-----------------

* ZodTTD I used the same version of CPU core as his Snes4Iphone project

* Mark and Jean-loup for zlib library.


Changelog
---------


Legal / Disclaimer
------------------
  Snes9x - Portable Super Nintendo Entertainment System (TM) emulator.

  (c) Copyright 1996 - 2002 Gary Henderson and Jerremy Koot

  (c) Copyright 2001 - 2004 John Weidman

  (c) Copyright 2002 - 2004 Brad Jorsch,
                            funkyass,
                            Joel Yliluoma,
                            Kris Bleakley,
                            Matthew Kendora,
                            Nach,
                            Peter Bortas and
                            zones

  C4 x86 assembler and some C emulation code
  (c) Copyright 2000 - 2003 zsKnight,
                            _Demo_, and Nach

  C4 C++ code
  (c) Copyright 2003 Brad Jorsch

  DSP-1 emulator code
  (c) Copyright 1998 - 2004 Ivar , _Demo_, Gary Henderson,
                            John Weidman, neviksti,
                            Kris Bleakley, Andreas Naive

  DSP-2 emulator code
  (c) Copyright 2003 Kris Bleakley, John Weidman, neviksti, Matthew Kendora, and
                     Lord Nightmare

  OBC1 emulator code
  (c) Copyright 2001 - 2004 zsKnight, pagefault and
                            Kris Bleakley
  Ported from x86 assembler to C by sanmaiwashi

  SPC7110 and RTC C++ emulator code
  (c) Copyright 2002 Matthew Kendora with research by
                     zsKnight, John Weidman, and Dark Force

  S-DD1 C emulator code
  (c) Copyright 2003 Brad Jorsch with research by
                     Andreas Naive and John Weidman
 
  S-RTC C emulator code
  (c) Copyright 2001 John Weidman
  
  ST010 C++ emulator code
  (c) Copyright 2003 Feather, Kris Bleakley, John Weidman and Matthew Kendora

  Super FX x86 assembler emulator code 
  (c) Copyright 1998 - 2003 zsKnight, _Demo_, and pagefault 

  Super FX C emulator code 
  (c) Copyright 1997 - 1999 Ivar, Gary Henderson and John Weidman

  SH assembler code partly based on x86 assembler code
  (c) Copyright 2002 - 2004 Marcus Comstedt


  Permission to use, copy, modify and distribute Snes9x in both binary and
  source form, for non-commercial purposes, is hereby granted without fee,
  providing that this license information and copyright notice appear with
  all copies and any derived work.
 
  This software is provided 'as-is', without any express or implied
  warranty. In no event shall the authors be held liable for any damages
  arising from the use of this software.
 
  Snes9x is freeware for PERSONAL USE only. Commercial users should
  seek permission of the copyright holders first. Commercial use includes
  charging money for Snes9x or software derived from Snes9x.
 
  The copyright holders request that bug fixes and improvements to the code
  should be forwarded to them so everyone can benefit from the modifications
  in future versions.
 
  Super NES and Super Nintendo Entertainment System are trademarks of
  Nintendo Co., Limited and its subsidiary companies.
