;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: CSDTABLE.asm
;;  Version: 2.10, Updated on 2012/9/21 at 11:56:9
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: CSD User Module Sensor Table
;;
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2012. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "CSD.inc"

;-----------------------------------------------
;  Global Labels
;-----------------------------------------------

; Exported table
export  CSD_Sensor_Table
export _CSD_Sensor_Table
export  CSD_Group_Table
export _CSD_Group_Table
export  CSD_Diplex_Table
export _CSD_Diplex_Table

AREA UserModules (ROM, REL, CON)

.LITERAL
;---------------------------------
; Tables below generated by Wizard
;---------------------------------
; The Sensor Table consists of two bytes for each sensor.  The first byte is the
; port number and the second is the bit mask for the bit not to be confused with
; the bit number.  For example an entry for port 2 bit 3 (P2[3])  would be
; "dw 0x0208".  This table consist of 0x1e sensors.
 CSD_Sensor_Table:
_CSD_Sensor_Table:
	dw	0x0408	// Port 4 Bit 3
	dw	0x0202	// Port 2 Bit 1
	dw	0x0208	// Port 2 Bit 3
	dw	0x0220	// Port 2 Bit 5
	dw	0x0020	// Port 0 Bit 5
	dw	0x0080	// Port 0 Bit 7
	dw	0x0120	// Port 1 Bit 5
	dw	0x0201	// Port 2 Bit 0
	dw	0x0404	// Port 4 Bit 2
	dw	0x0401	// Port 4 Bit 0
	dw	0x0340	// Port 3 Bit 6
	dw	0x0310	// Port 3 Bit 4
	dw	0x0304	// Port 3 Bit 2
	dw	0x0301	// Port 3 Bit 0
	dw	0x0040	// Port 0 Bit 6
	dw	0x0010	// Port 0 Bit 4
	dw	0x0004	// Port 0 Bit 2
	dw	0x0001	// Port 0 Bit 0
	dw	0x0240	// Port 2 Bit 6
	dw	0x0210	// Port 2 Bit 4
	dw	0x0204	// Port 2 Bit 2
	dw	0x0008	// Port 0 Bit 3
	dw	0x0280	// Port 2 Bit 7
	dw	0x0402	// Port 4 Bit 1
	dw	0x0380	// Port 3 Bit 7
	dw	0x0320	// Port 3 Bit 5
	dw	0x0308	// Port 3 Bit 3
	dw	0x0302	// Port 3 Bit 1
	dw	0x0180	// Port 1 Bit 7
	dw	0x0108	// Port 1 Bit 3


;-----------------------------------------------------------------------------
; The Group Table defines each of the groups of button sensors or sliders.
; There is one entry for each slider plus one for the free button sensors.
; The first entry is always the free sensors.  Each entry is four bytes.
;
; The first byte is the index in the Sensor Table where the group starts.
;
; The second byte is how many sensors are in that group.  For example, in a
; system where there are 8 free sensors and two sliders, the first with 8
; sensors and the second with 4, the table would look like the following.
;  db 0, 8
;  db 8, 8
;  db 16, 4
;
; The third byte signifies whether the slider is diplexed or not (non-zero is
; diplexed, 0 is not diplexed).
;
; The fourth, fifth, and sixth bytes are the fixed point multiplier that the
; slider's calculated centroid will be multiplied by to achieve the resolution
; desired in the CSD wizard.  The multiplier is three bytes containing the
; following bit definitions:
;  MSB:
;    bit 7   bit 6   bit 5   bit 4   bit 3   bit 2   bit 1   bit 0
;     x2^15	  x2^14   x2^13   x2^12   x2^11   x2^10   x2^9    x2^8
;  ISB:
;    bit 7   bit 6   bit 5   bit 4   bit 3   bit 2   bit 1   bit 0
;     x128	  x64     x32     x16     x8      x4      x2      x1
;  LSB:
;    bit 7   bit 6   bit 5   bit 4   bit 3   bit 2   bit 1   bit 0
;     x1/2	  x1/4    x1/8    x1/16   x1/32   x1/64   x1/128  x1/256
;
; The formula for the Multiplier is:
; Multiplier = ((Resolution-1) * 256) / (SensorsInSlider - 1)
;
; For example, if you had a 10 sensor slider and you wanted a resolution of
; 100, the multiplier would need to be 0x000B00:
; MSB 00h
; ISB 0Bh
; LSB 00h
; The GUI automatically calculates these values based on the resolution needed.
;
; There are 0x1 groups counting the free sensors.
;-----------------------------------------------------------------------------
 CSD_Group_Table:
_CSD_Group_Table:
; Group Table:
;    Origin    Count    Diplex?    DivBtwSw(wholeMSB, wholeLSB, fractByte)
 db   0x0,      0x00,	 0x00,	 0x00,	 0x00,	 0x00 ; Buttons
 db   0x00,	    0x1E,	 0x00,	 0x00,	 0x46,	 0x96 ; Slider 1


;-----------------------------------------------------------------------------
; Diplex table scan order data is produced for a group when it is a slider and
; is also diplexed.  Otherwise a label is created but no data is placed.  The
; data represents the physical representation of the sensors in their location
; on the PCB.  A label containing the pointer to the corresponding table is
; also produced for referencing in the high-level centroid calculation
; function.
;-----------------------------------------------------------------------------
 CSD_Diplex_Table:
_CSD_Diplex_Table:
	db >DiplexTable_0, <DiplexTable_0
	db >DiplexTable_1, <DiplexTable_1

.ENDLITERAL

IF	(TOOLCHAIN & HITECH)
  AREA lit (ROM,REL,CON)
ELSE
  AREA lit (ROM,REL,CON,LIT)
ENDIF

IF(CSD_DiplexUsed)
.LITERAL
ENDIF

DiplexTable_0:
; This group is not a diplexed slider
DiplexTable_1:
; This group is not a diplexed slider

IF(CSD_DiplexUsed)
.ENDLITERAL
ENDIF
