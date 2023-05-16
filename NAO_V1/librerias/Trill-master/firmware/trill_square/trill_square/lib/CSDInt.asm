;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: CSDINT.asm
;;  Version: 2.10, Updated on 2012/9/21 at 11:56:9
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: CSD User Module ISR implementation file.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2012. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------

export  _CSD_ISR

AREA InterruptRAM (RAM,REL,CON)

;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
; Includes
;------------------------


;------------------------
;  Constant Definitions
;------------------------


;------------------------
; Variable Allocation
;------------------------


;---------------------------------------------------
; Insert your custom declarations above this banner
;---------------------------------------------------
;@PSoC_UserCode_END@ (Do not change this line.)


AREA UserModules (ROM, REL)
LSB:  equ  1
MSB:  equ  0

;-----------------------------------------------------------------------------
;  FUNCTION NAME: _CSD_ISR
;
;  DESCRIPTION: Unless modified, this sets coversion ready flag only .
;
;-----------------------------------------------------------------------------
;

_CSD_ISR:

   push   A
   mov    A, reg[CS_CNTL]
   add    [CSD_wADC_Result+LSB], A
   mov    A, reg[CS_CNTH]
   adc    [CSD_wADC_Result+MSB], A

   mov    [CSD_bADCStatus], 1

   ;@PSoC_UserCode_BODY@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   pop A
   reti


; end of file CSDINT.asm